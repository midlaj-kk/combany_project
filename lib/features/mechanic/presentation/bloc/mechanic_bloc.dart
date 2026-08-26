import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/mechanic_repository.dart';
import '../../data/models/service_work_model.dart';
import '../../data/models/part_used_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class MechanicEvent extends Equatable {
  const MechanicEvent();
  @override
  List<Object?> get props => [];
}

class MechanicWorksLoadRequested extends MechanicEvent {
  final int? serviceJob;
  final int? page;
  const MechanicWorksLoadRequested({this.serviceJob, this.page});
  @override
  List<Object?> get props => [serviceJob, page];
}

class MechanicWorkCreateRequested extends MechanicEvent {
  final ServiceWorkCreateRequest request;
  const MechanicWorkCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class MechanicWorkStatusUpdateRequested extends MechanicEvent {
  final int workId;
  final String status;
  const MechanicWorkStatusUpdateRequested({
    required this.workId,
    required this.status,
  });
  @override
  List<Object?> get props => [workId, status];
}

class MechanicPartsUsedLoadRequested extends MechanicEvent {
  final int? serviceJob;
  final int? page;
  const MechanicPartsUsedLoadRequested({this.serviceJob, this.page});
  @override
  List<Object?> get props => [serviceJob, page];
}

class MechanicPartUsedAddRequested extends MechanicEvent {
  final PartUsedCreateRequest request;
  const MechanicPartUsedAddRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class MechanicPartUsedDeleteRequested extends MechanicEvent {
  final int id;
  const MechanicPartUsedDeleteRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

// ── States ─────────────────────────────────────────────────────────────────

abstract class MechanicState extends Equatable {
  const MechanicState();
  @override
  List<Object?> get props => [];
}

class MechanicInitial extends MechanicState {
  const MechanicInitial();
}

class MechanicLoading extends MechanicState {
  const MechanicLoading();
}

class MechanicWorksLoaded extends MechanicState {
  final PaginatedServiceWorkList works;
  const MechanicWorksLoaded({required this.works});
  @override
  List<Object?> get props => [works];
}

class MechanicWorkCreated extends MechanicState {
  final ServiceWorkModel work;
  const MechanicWorkCreated({required this.work});
  @override
  List<Object?> get props => [work];
}

class MechanicWorkUpdated extends MechanicState {
  final ServiceWorkModel work;
  const MechanicWorkUpdated({required this.work});
  @override
  List<Object?> get props => [work];
}

class MechanicPartsUsedLoaded extends MechanicState {
  final PaginatedPartUsedList partsUsed;
  const MechanicPartsUsedLoaded({required this.partsUsed});
  @override
  List<Object?> get props => [partsUsed];
}

class MechanicPartUsedAdded extends MechanicState {
  final PartUsedModel partUsed;
  const MechanicPartUsedAdded({required this.partUsed});
  @override
  List<Object?> get props => [partUsed];
}

class MechanicPartUsedDeleted extends MechanicState {
  const MechanicPartUsedDeleted();
}

class MechanicActionSuccess extends MechanicState {
  final String message;
  const MechanicActionSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class MechanicError extends MechanicState {
  final String message;
  const MechanicError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class MechanicBloc extends Bloc<MechanicEvent, MechanicState> {
  final MechanicRepository repository;

  MechanicBloc({required this.repository}) : super(const MechanicInitial()) {
    on<MechanicWorksLoadRequested>(_onLoadWorks);
    on<MechanicWorkCreateRequested>(_onCreateWork);
    on<MechanicWorkStatusUpdateRequested>(_onUpdateWorkStatus);
    on<MechanicPartsUsedLoadRequested>(_onLoadPartsUsed);
    on<MechanicPartUsedAddRequested>(_onAddPartUsed);
    on<MechanicPartUsedDeleteRequested>(_onDeletePartUsed);
  }

  Future<void> _onLoadWorks(
    MechanicWorksLoadRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.getWorks(
      serviceJob: event.serviceJob,
      page: event.page,
    );
    switch (result) {
      case Success<PaginatedServiceWorkList>():
        emit(MechanicWorksLoaded(works: result.data));
      case FailureResult<PaginatedServiceWorkList>():
        emit(MechanicError(message: result.message));
    }
  }

  Future<void> _onCreateWork(
    MechanicWorkCreateRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.createWork(event.request);
    switch (result) {
      case Success<ServiceWorkModel>():
        emit(MechanicWorkCreated(work: result.data));
      case FailureResult<ServiceWorkModel>():
        emit(MechanicError(message: result.message));
    }
  }

  Future<void> _onUpdateWorkStatus(
    MechanicWorkStatusUpdateRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.updateWorkStatus(event.workId, event.status);
    switch (result) {
      case Success<ServiceWorkModel>():
        emit(MechanicWorkUpdated(work: result.data));
      case FailureResult<ServiceWorkModel>():
        emit(MechanicError(message: result.message));
    }
  }

  Future<void> _onLoadPartsUsed(
    MechanicPartsUsedLoadRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.getPartsUsed(
      serviceJob: event.serviceJob,
      page: event.page,
    );
    switch (result) {
      case Success<PaginatedPartUsedList>():
        emit(MechanicPartsUsedLoaded(partsUsed: result.data));
      case FailureResult<PaginatedPartUsedList>():
        emit(MechanicError(message: result.message));
    }
  }

  Future<void> _onAddPartUsed(
    MechanicPartUsedAddRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.addPartUsed(event.request);
    switch (result) {
      case Success<PartUsedModel>():
        emit(MechanicPartUsedAdded(partUsed: result.data));
      case FailureResult<PartUsedModel>():
        emit(MechanicError(message: result.message));
    }
  }

  Future<void> _onDeletePartUsed(
    MechanicPartUsedDeleteRequested event,
    Emitter<MechanicState> emit,
  ) async {
    emit(const MechanicLoading());
    final result = await repository.deletePartUsed(event.id);
    switch (result) {
      case Success<void>():
        emit(const MechanicPartUsedDeleted());
      case FailureResult<void>():
        emit(MechanicError(message: result.message));
    }
  }
}
