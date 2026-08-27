import '../models/service_job_model.dart';

abstract class JobEvent {
  const JobEvent();
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
}

class JobLoadRequested extends JobEvent {
  final int id;
  const JobLoadRequested({required this.id});
}

class JobCreateRequested extends JobEvent {
  final ServiceJobCreateRequest request;
  const JobCreateRequested({required this.request});
}

class JobAssignMechanicRequested extends JobEvent {
  final int jobId;
  final int mechanicId;
  const JobAssignMechanicRequested({
    required this.jobId,
    required this.mechanicId,
  });
}

class JobChangeMechanicRequested extends JobEvent {
  final int jobId;
  final int mechanicId;
  const JobChangeMechanicRequested({
    required this.jobId,
    required this.mechanicId,
  });
}

class JobUpdateStatusRequested extends JobEvent {
  final int jobId;
  final String status;
  const JobUpdateStatusRequested({
    required this.jobId,
    required this.status,
  });
}
