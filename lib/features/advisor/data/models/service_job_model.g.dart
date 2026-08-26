// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceJobModel _$ServiceJobModelFromJson(Map<String, dynamic> json) =>
    _ServiceJobModel(
      id: (json['id'] as num).toInt(),
      jobNumber: json['job_number'] as String,
      vehicle: (json['vehicle'] as num).toInt(),
      vehicleNumber: json['vehicle_number'] as String?,
      customerName: json['customer_name'] as String?,
      complaint: json['complaint'] as String,
      serviceType: json['service_type'] as String,
      assignedMechanic: (json['assigned_mechanic'] as num?)?.toInt(),
      mechanicName: json['mechanic_name'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ServiceJobStatusEnumMap, json['status']),
      odometerReading: (json['odometer_reading'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ServiceJobModelToJson(_ServiceJobModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_number': instance.jobNumber,
      'vehicle': instance.vehicle,
      'vehicle_number': instance.vehicleNumber,
      'customer_name': instance.customerName,
      'complaint': instance.complaint,
      'service_type': instance.serviceType,
      'assigned_mechanic': instance.assignedMechanic,
      'mechanic_name': instance.mechanicName,
      'created_by': instance.createdBy,
      'status': _$ServiceJobStatusEnumMap[instance.status],
      'odometer_reading': instance.odometerReading,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$ServiceJobStatusEnumMap = {
  ServiceJobStatus.waiting: 'waiting',
  ServiceJobStatus.inProgress: 'in_progress',
  ServiceJobStatus.waitingForParts: 'waiting_for_parts',
  ServiceJobStatus.qcPending: 'qc_pending',
  ServiceJobStatus.reworkRequired: 'rework_required',
  ServiceJobStatus.readyForBill: 'ready_for_bill',
  ServiceJobStatus.readyForDelivery: 'ready_for_delivery',
  ServiceJobStatus.delivered: 'delivered',
  ServiceJobStatus.cancelled: 'cancelled',
};

_ServiceJobCreateRequest _$ServiceJobCreateRequestFromJson(
  Map<String, dynamic> json,
) => _ServiceJobCreateRequest(
  vehicle: (json['vehicle'] as num).toInt(),
  complaint: json['complaint'] as String,
  serviceType: json['service_type'] as String,
  assignedMechanic: (json['assigned_mechanic'] as num?)?.toInt(),
  odometerReading: (json['odometer_reading'] as num?)?.toInt(),
);

Map<String, dynamic> _$ServiceJobCreateRequestToJson(
  _ServiceJobCreateRequest instance,
) => <String, dynamic>{
  'vehicle': instance.vehicle,
  'complaint': instance.complaint,
  'service_type': instance.serviceType,
  'assigned_mechanic': instance.assignedMechanic,
  'odometer_reading': instance.odometerReading,
};

_PaginatedServiceJobList _$PaginatedServiceJobListFromJson(
  Map<String, dynamic> json,
) => _PaginatedServiceJobList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ServiceJobModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedServiceJobListToJson(
  _PaginatedServiceJobList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
