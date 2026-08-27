import '../models/vehicle_model.dart';

abstract class VehicleEvent {
  const VehicleEvent();
}

class VehicleLoadRequested extends VehicleEvent {
  final int id;
  const VehicleLoadRequested({required this.id});
}

class VehicleCreateRequested extends VehicleEvent {
  final VehicleCreateRequest request;
  const VehicleCreateRequested({required this.request});
}

class VehicleHistoryLoadRequested extends VehicleEvent {
  final int vehicleId;
  const VehicleHistoryLoadRequested({required this.vehicleId});
}
