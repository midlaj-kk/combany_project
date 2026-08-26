import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/job_repository.dart';
import '../../data/models/service_job_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class JobEvent extends Equatable {
  const JobEvent();
  @override
  List<Object?> get props => [];
}

class JobsLoadRequested extends JobEvent {
  final String? status;
  final int? assignedMechanic;
  final String? search;
  final int? page;
  const JobsLoadRequested({
    this.status,
    this.assignedMechanic,
    this.search,
    this.page,
  });
  @override
  List<Object?> get props => [status, assignedMechanic, search, page];
}

class JobLoadRequested extends JobEvent {
  final int id;
  const JobLoadRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class JobCreateRequested extends JobEvent {
  final ServiceJobCreateRequest request;
  const JobCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class JobAssignMechanicRequested extends JobEvent {
  final int jobId;
  final int mechanicId;
  const JobAssignMechanicRequested({
    required this.jobId,
    required this.mechanicId,
  });
  @override
  List<Object?> get props => [jobId, mechanicId];
}

class JobChangeMechanicRequested extends JobEvent {
  final int jobId;
  final int mechanicId;
  const JobChangeMechanicRequested({
    required this.jobId,
    required this.mechanicId,
  });
  @override
  List<Object?> get props => [jobId, mechanicId];
}

class JobUpdateStatusRequested extends JobEvent {
  final int jobId;
  final String status;
  const JobUpdateStatusRequested({
    required this.jobId,
    required this.status,
  });
  @override
  List<Object?> get props => [jobId, status];
}

// ── States ─────────────────────────────────────────────────────────────────

abstract class JobState extends Equatable {
  const JobState();
  @override
  List<Object?> get props => [];
}

class JobInitial extends JobState {
  const JobInitial();
}

class JobLoading extends JobState {
  const JobLoading();
}

class JobsLoaded extends JobState {
  final PaginatedServiceJobList jobs;
  const JobsLoaded({required this.jobs});
  @override
  List<Object?> get props => [jobs];
}

class JobLoaded extends JobState {
  final ServiceJobModel job;
  const JobLoaded({required this.job});
  @override
  List<Object?> get props => [job];
}

class JobCreated extends JobState {
  final ServiceJobModel job;
  const JobCreated({required this.job});
  @override
  List<Object?> get props => [job];
}

class JobUpdated extends JobState {
  final ServiceJobModel job;
  const JobUpdated({required this.job});
  @override
  List<Object?> get props => [job];
}

class JobError extends JobState {
  final String message;
  const JobError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository repository;

  JobBloc({required this.repository}) : super(const JobInitial()) {
    on<JobsLoadRequested>(_onLoadJobs);
    on<JobLoadRequested>(_onLoadJob);
    on<JobCreateRequested>(_onCreateJob);
    on<JobAssignMechanicRequested>(_onAssignMechanic);
    on<JobChangeMechanicRequested>(_onChangeMechanic);
    on<JobUpdateStatusRequested>(_onUpdateStatus);
  }

  Future<void> _onLoadJobs(
    JobsLoadRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.getJobs(
      status: event.status,
      assignedMechanic: event.assignedMechanic,
      search: event.search,
      page: event.page,
    );
    switch (result) {
      case Success<PaginatedServiceJobList>():
        emit(JobsLoaded(jobs: result.data));
      case FailureResult<PaginatedServiceJobList>():
        emit(JobError(message: result.message));
    }
  }

  Future<void> _onLoadJob(
    JobLoadRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.getJob(event.id);
    switch (result) {
      case Success<ServiceJobModel>():
        emit(JobLoaded(job: result.data));
      case FailureResult<ServiceJobModel>():
        emit(JobError(message: result.message));
    }
  }

  Future<void> _onCreateJob(
    JobCreateRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.createJob(event.request);
    switch (result) {
      case Success<ServiceJobModel>():
        emit(JobCreated(job: result.data));
      case FailureResult<ServiceJobModel>():
        emit(JobError(message: result.message));
    }
  }

  Future<void> _onAssignMechanic(
    JobAssignMechanicRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.assignMechanic(event.jobId, event.mechanicId);
    switch (result) {
      case Success<ServiceJobModel>():
        emit(JobUpdated(job: result.data));
      case FailureResult<ServiceJobModel>():
        emit(JobError(message: result.message));
    }
  }

  Future<void> _onChangeMechanic(
    JobChangeMechanicRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.changeMechanic(event.jobId, event.mechanicId);
    switch (result) {
      case Success<ServiceJobModel>():
        emit(JobUpdated(job: result.data));
      case FailureResult<ServiceJobModel>():
        emit(JobError(message: result.message));
    }
  }

  Future<void> _onUpdateStatus(
    JobUpdateStatusRequested event,
    Emitter<JobState> emit,
  ) async {
    emit(const JobLoading());
    final result = await repository.updateJobStatus(event.jobId, event.status);
    switch (result) {
      case Success<ServiceJobModel>():
        emit(JobUpdated(job: result.data));
      case FailureResult<ServiceJobModel>():
        emit(JobError(message: result.message));
    }
  }
}
