// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) =>
    _VehicleModel(
      id: (json['id'] as num).toInt(),
      vehicleNumber: json['vehicle_number'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      kilometers: (json['kilometers'] as num?)?.toInt() ?? 0,
      status: $enumDecodeNullable(_$VehicleStatusEnumMap, json['status']),
      customer: (json['customer'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(_VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle_number': instance.vehicleNumber,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'kilometers': instance.kilometers,
      'status': _$VehicleStatusEnumMap[instance.status],
      'customer': instance.customer,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$VehicleStatusEnumMap = {
  VehicleStatus.active: 'active',
  VehicleStatus.inactive: 'inactive',
};

_VehicleCreateRequest _$VehicleCreateRequestFromJson(
  Map<String, dynamic> json,
) => _VehicleCreateRequest(
  vehicleNumber: json['vehicle_number'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: (json['year'] as num?)?.toInt(),
  kilometers: (json['kilometers'] as num?)?.toInt() ?? 0,
  customer: (json['customer'] as num).toInt(),
);

Map<String, dynamic> _$VehicleCreateRequestToJson(
  _VehicleCreateRequest instance,
) => <String, dynamic>{
  'vehicle_number': instance.vehicleNumber,
  'brand': instance.brand,
  'model': instance.model,
  'year': instance.year,
  'kilometers': instance.kilometers,
  'customer': instance.customer,
};

_PaginatedVehicleList _$PaginatedVehicleListFromJson(
  Map<String, dynamic> json,
) => _PaginatedVehicleList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedVehicleListToJson(
  _PaginatedVehicleList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
