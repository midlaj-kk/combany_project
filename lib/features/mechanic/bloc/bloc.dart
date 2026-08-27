import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/mechanic_service.dart';
import 'event.dart';
import 'state.dart';

class MechanicBloc extends Bloc<MechanicEvent, MechanicState> {
  final MechanicService service;

  MechanicBloc({required this.service}) : super(const MechanicInitial()) {
    on<MechanicWorksLoadRequested>(_onLoadWorks);
    on<MechanicWorkCreateRequested>(_onCreateWork);
    on<MechanicWorkStatusUpdateRequested>(_onUpdateWorkStatus);
    on<MechanicPartsUsedLoadRequested>(_onLoadPartsUsed);
    on<MechanicPartUsedAddRequested>(_onAddPartUsed);
    on<MechanicPartUsedDeleteRequested>(_onDeletePartUsed);
  }

  Future<void> _onLoadWorks(MechanicWorksLoadRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      final works = await service.getWorks(serviceJob: event.serviceJob, page: event.page);
      emit(MechanicWorksLoaded(works: works));
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }

  Future<void> _onCreateWork(MechanicWorkCreateRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      final work = await service.createWork(event.request);
      emit(MechanicWorkCreated(work: work));
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }

  Future<void> _onUpdateWorkStatus(MechanicWorkStatusUpdateRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      final work = await service.updateWorkStatus(event.workId, event.status);
      emit(MechanicWorkUpdated(work: work));
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }

  Future<void> _onLoadPartsUsed(MechanicPartsUsedLoadRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      final partsUsed = await service.getPartsUsed(serviceJob: event.serviceJob, page: event.page);
      emit(MechanicPartsUsedLoaded(partsUsed: partsUsed));
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }

  Future<void> _onAddPartUsed(MechanicPartUsedAddRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      final partUsed = await service.addPartUsed(event.request);
      emit(MechanicPartUsedAdded(partUsed: partUsed));
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }

  Future<void> _onDeletePartUsed(MechanicPartUsedDeleteRequested event, Emitter<MechanicState> emit) async {
    emit(const MechanicLoading());
    try {
      await service.deletePartUsed(event.id);
      emit(const MechanicPartUsedDeleted());
    } catch (e) {
      emit(MechanicError(message: e.toString()));
    }
  }
}
