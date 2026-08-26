// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_used_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartUsedModel _$PartUsedModelFromJson(Map<String, dynamic> json) =>
    _PartUsedModel(
      id: (json['id'] as num).toInt(),
      serviceJob: (json['service_job'] as num).toInt(),
      part: (json['part'] as num).toInt(),
      partName: json['part_name'] as String?,
      partNumber: json['part_number'] as String?,
      quantity: json['quantity'] as String,
      price: json['price'] as String?,
      addedBy: (json['added_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PartUsedModelToJson(_PartUsedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_job': instance.serviceJob,
      'part': instance.part,
      'part_name': instance.partName,
      'part_number': instance.partNumber,
      'quantity': instance.quantity,
      'price': instance.price,
      'added_by': instance.addedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_PartUsedCreateRequest _$PartUsedCreateRequestFromJson(
  Map<String, dynamic> json,
) => _PartUsedCreateRequest(
  serviceJob: (json['service_job'] as num).toInt(),
  part: (json['part'] as num).toInt(),
  quantity: json['quantity'] as String,
);

Map<String, dynamic> _$PartUsedCreateRequestToJson(
  _PartUsedCreateRequest instance,
) => <String, dynamic>{
  'service_job': instance.serviceJob,
  'part': instance.part,
  'quantity': instance.quantity,
};

_PaginatedPartUsedList _$PaginatedPartUsedListFromJson(
  Map<String, dynamic> json,
) => _PaginatedPartUsedList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PartUsedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedPartUsedListToJson(
  _PaginatedPartUsedList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
