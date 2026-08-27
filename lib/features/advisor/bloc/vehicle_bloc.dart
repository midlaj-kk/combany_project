import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/advisor_service.dart';
import '../models/service_job_model.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

export 'vehicle_event.dart';
export 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final AdvisorService service;

  VehicleBloc({required this.service}) : super(const VehicleInitial()) {
    on<VehicleLoadRequested>(_onLoadVehicle);
    on<VehicleCreateRequested>(_onCreateVehicle);
    on<VehicleHistoryLoadRequested>(_onLoadHistory);
  }

  Future<void> _onLoadVehicle(
    VehicleLoadRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    try {
      final vehicle = await service.getVehicle(event.id);
      emit(VehicleLoaded(vehicle: vehicle));
    } catch (e) {
      emit(VehicleError(message: e.toString()));
    }
  }

  Future<void> _onCreateVehicle(
    VehicleCreateRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    try {
      final vehicle = await service.createVehicle(event.request);
      emit(VehicleCreated(vehicle: vehicle));
    } catch (e) {
      emit(VehicleError(message: e.toString()));
    }
  }

  Future<void> _onLoadHistory(
    VehicleHistoryLoadRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    try {
      final rawHistory = await service.getVehicleHistory(event.vehicleId);
      final jobs = rawHistory
          .map((e) => ServiceJobModel.fromJson(e as Map<String, dynamic>))
          .toList();
      emit(VehicleHistoryLoaded(jobs: jobs));
    } catch (e) {
      emit(VehicleError(message: e.toString()));
    }
  }
}
