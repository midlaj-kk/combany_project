import '../models/service_work_model.dart';
import '../models/part_used_model.dart';

abstract class MechanicEvent {
  const MechanicEvent();
}

class MechanicWorksLoadRequested extends MechanicEvent {
  final int? serviceJob;
  final int? page;
  const MechanicWorksLoadRequested({this.serviceJob, this.page});
}

class MechanicWorkCreateRequested extends MechanicEvent {
  final ServiceWorkCreateRequest request;
  const MechanicWorkCreateRequested({required this.request});
}

class MechanicWorkStatusUpdateRequested extends MechanicEvent {
  final int workId;
  final String status;
  const MechanicWorkStatusUpdateRequested({required this.workId, required this.status});
}

class MechanicPartsUsedLoadRequested extends MechanicEvent {
  final int? serviceJob;
  final int? page;
  const MechanicPartsUsedLoadRequested({this.serviceJob, this.page});
}

class MechanicPartUsedAddRequested extends MechanicEvent {
  final PartUsedCreateRequest request;
  const MechanicPartUsedAddRequested({required this.request});
}

class MechanicPartUsedDeleteRequested extends MechanicEvent {
  final int id;
  const MechanicPartUsedDeleteRequested({required this.id});
}
