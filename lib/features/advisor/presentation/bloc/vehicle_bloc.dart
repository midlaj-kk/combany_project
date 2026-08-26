import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../../data/models/vehicle_model.dart';
import '../../data/models/service_job_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();
  @override
  List<Object?> get props => [];
}

class VehicleLoadRequested extends VehicleEvent {
  final int id;
  const VehicleLoadRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class VehicleCreateRequested extends VehicleEvent {
  final VehicleCreateRequest request;
  const VehicleCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class VehicleHistoryLoadRequested extends VehicleEvent {
  final int vehicleId;
  const VehicleHistoryLoadRequested({required this.vehicleId});
  @override
  List<Object?> get props => [vehicleId];
}

// ── States ─────────────────────────────────────────────────────────────────

abstract class VehicleState extends Equatable {
  const VehicleState();
  @override
  List<Object?> get props => [];
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
  @override
  List<Object?> get props => [vehicle];
}

class VehicleCreated extends VehicleState {
  final VehicleModel vehicle;
  const VehicleCreated({required this.vehicle});
  @override
  List<Object?> get props => [vehicle];
}

class VehicleHistoryLoaded extends VehicleState {
  final List<ServiceJobModel> jobs;
  const VehicleHistoryLoaded({required this.jobs});
  @override
  List<Object?> get props => [jobs];
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository repository;

  VehicleBloc({required this.repository}) : super(const VehicleInitial()) {
    on<VehicleLoadRequested>(_onLoadVehicle);
    on<VehicleCreateRequested>(_onCreateVehicle);
    on<VehicleHistoryLoadRequested>(_onLoadHistory);
  }

  Future<void> _onLoadVehicle(
    VehicleLoadRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    final result = await repository.getVehicle(event.id);
    switch (result) {
      case Success<VehicleModel>():
        emit(VehicleLoaded(vehicle: result.data));
      case FailureResult<VehicleModel>():
        emit(VehicleError(message: result.message));
    }
  }

  Future<void> _onCreateVehicle(
    VehicleCreateRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    final result = await repository.createVehicle(event.request);
    switch (result) {
      case Success<VehicleModel>():
        emit(VehicleCreated(vehicle: result.data));
      case FailureResult<VehicleModel>():
        emit(VehicleError(message: result.message));
    }
  }

  Future<void> _onLoadHistory(
    VehicleHistoryLoadRequested event,
    Emitter<VehicleState> emit,
  ) async {
    emit(const VehicleLoading());
    final result = await repository.getVehicleHistory(event.vehicleId);
    switch (result) {
      case Success<List<ServiceJobModel>>():
        emit(VehicleHistoryLoaded(jobs: result.data));
      case FailureResult<List<ServiceJobModel>>():
        emit(VehicleError(message: result.message));
    }
  }
}
