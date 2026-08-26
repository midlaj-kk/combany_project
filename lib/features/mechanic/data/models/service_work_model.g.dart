// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceWorkModel _$ServiceWorkModelFromJson(Map<String, dynamic> json) =>
    _ServiceWorkModel(
      id: (json['id'] as num).toInt(),
      workName: json['work_name'] as String,
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$ServiceWorkStatusEnumMap, json['status']),
      labourCharge: json['labour_charge'] as String?,
      serviceJob: (json['service_job'] as num).toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ServiceWorkModelToJson(_ServiceWorkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'work_name': instance.workName,
      'description': instance.description,
      'status': _$ServiceWorkStatusEnumMap[instance.status],
      'labour_charge': instance.labourCharge,
      'service_job': instance.serviceJob,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$ServiceWorkStatusEnumMap = {
  ServiceWorkStatus.pending: 'pending',
  ServiceWorkStatus.inProgress: 'in_progress',
  ServiceWorkStatus.completed: 'completed',
};

_ServiceWorkCreateRequest _$ServiceWorkCreateRequestFromJson(
  Map<String, dynamic> json,
) => _ServiceWorkCreateRequest(
  workName: json['work_name'] as String,
  description: json['description'] as String?,
  labourCharge: json['labour_charge'] as String?,
  serviceJob: (json['service_job'] as num).toInt(),
);

Map<String, dynamic> _$ServiceWorkCreateRequestToJson(
  _ServiceWorkCreateRequest instance,
) => <String, dynamic>{
  'work_name': instance.workName,
  'description': instance.description,
  'labour_charge': instance.labourCharge,
  'service_job': instance.serviceJob,
};

_PaginatedServiceWorkList _$PaginatedServiceWorkListFromJson(
  Map<String, dynamic> json,
) => _PaginatedServiceWorkList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ServiceWorkModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedServiceWorkListToJson(
  _PaginatedServiceWorkList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
