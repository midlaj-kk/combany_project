import '../models/vehicle_model.dart';
import '../models/service_job_model.dart';

abstract class VehicleState {
  const VehicleState();
}

class VehicleInitial extends VehicleState {
  const VehicleInitial();
}

class VehicleLoading extends VehicleState {
  const VehicleLoading();
}

class VehicleLoaded extends VehicleState {
  final VehicleModel vehicle;
  const VehicleLoaded({required this.vehicle});
}

class VehicleCreated extends VehicleState {
  final VehicleModel vehicle;
  const VehicleCreated({required this.vehicle});
}

class VehicleHistoryLoaded extends VehicleState {
  final List<ServiceJobModel> jobs;
  const VehicleHistoryLoaded({required this.jobs});
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError({required this.message});
}
