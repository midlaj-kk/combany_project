import '../models/service_job_model.dart';

abstract class JobState {
  const JobState();
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
}

class JobLoaded extends JobState {
  final ServiceJobModel job;
  const JobLoaded({required this.job});
}

class JobCreated extends JobState {
  final ServiceJobModel job;
  final String? mechanicWarning;
  const JobCreated({required this.job, this.mechanicWarning});
}

class JobUpdated extends JobState {
  final ServiceJobModel job;
  const JobUpdated({required this.job});
}

class JobError extends JobState {
  final String message;
  const JobError({required this.message});
}

class JobMechanicsLoaded extends JobState {
  final List<Map<String, dynamic>> mechanics;
  const JobMechanicsLoaded({required this.mechanics});
}
