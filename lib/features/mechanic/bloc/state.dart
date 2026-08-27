import '../models/service_work_model.dart';
import '../models/part_used_model.dart';

abstract class MechanicState {
  const MechanicState();
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
}

class MechanicWorkCreated extends MechanicState {
  final ServiceWorkModel work;
  const MechanicWorkCreated({required this.work});
}

class MechanicWorkUpdated extends MechanicState {
  const MechanicWorkUpdated();
}

class MechanicPartsUsedLoaded extends MechanicState {
  final PaginatedPartUsedList partsUsed;
  const MechanicPartsUsedLoaded({required this.partsUsed});
}

class MechanicPartUsedAdded extends MechanicState {
  final PartUsedModel partUsed;
  const MechanicPartUsedAdded({required this.partUsed});
}

class MechanicPartUsedDeleted extends MechanicState {
  const MechanicPartUsedDeleted();
}

class MechanicActionSuccess extends MechanicState {
  final String message;
  const MechanicActionSuccess({required this.message});
}

class MechanicError extends MechanicState {
  final String message;
  const MechanicError({required this.message});
}
