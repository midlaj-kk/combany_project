import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/advisor_service.dart';
import 'job_event.dart';
import 'job_state.dart';

export 'job_event.dart';
export 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final AdvisorService service;

  JobBloc({required this.service}) : super(const JobInitial()) {
    on<JobsLoadRequested>(_onLoadJobs);
    on<JobLoadRequested>(_onLoadJob);
    on<JobCreateRequested>(_onCreateJob);
    on<JobAssignMechanicRequested>(_onAssignMechanic);
    on<JobChangeMechanicRequested>(_onChangeMechanic);
    on<JobUpdateStatusRequested>(_onUpdateStatus);
    on<JobMechanicsLoadRequested>(_onLoadMechanics);
  }

  Future<void> _onLoadJobs(
    JobsLoadRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      final jobs = await service.getJobs(
        status: event.status,
        assignedMechanic: event.assignedMechanic,
        search: event.search,
        page: event.page,
        pageSize: event.pageSize,
      );
      emit(JobsLoaded(jobs: jobs));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onLoadJob(
    JobLoadRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      final job = await service.getJob(event.id);
      emit(JobLoaded(job: job));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onCreateJob(
    JobCreateRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      var job = await service.createJob(event.request);

      String? mechanicWarning;
      if (event.request.assignedMechanic != null) {
        try {
          job = await service.assignMechanic(job.id, event.request.assignedMechanic!);
        } catch (e) {
          mechanicWarning =
              'Job created, but the mechanic could not be assigned '
              '(${e.toString()}). It will need to be assigned later.';
        }
      }

      emit(JobCreated(job: job, mechanicWarning: mechanicWarning));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onAssignMechanic(
    JobAssignMechanicRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      final job = await service.assignMechanic(event.jobId, event.mechanicId);
      emit(JobUpdated(job: job));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onChangeMechanic(
    JobChangeMechanicRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      final job = await service.changeMechanic(event.jobId, event.mechanicId);
      emit(JobUpdated(job: job));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onUpdateStatus(
    JobUpdateStatusRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    try {
      final job = await service.updateJobStatus(event.jobId, event.status);
      emit(JobUpdated(job: job));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }

  Future<void> _onLoadMechanics(
    JobMechanicsLoadRequested event,
    Emitter<JobState> emit,
  ) async {
    try {
      final rawMechanics = await service.getMechanics();
      final mechanics = rawMechanics.map((e) {
        final map = e as Map<String, dynamic>;
        return {
          'id': map['id'] as int,
          'name': map['name'] as String? ?? '',
          'specialization': map['specialization'] as String? ?? '',
        };
      }).toList();
      emit(JobMechanicsLoaded(mechanics: mechanics));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }
}
