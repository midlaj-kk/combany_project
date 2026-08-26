// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      status: $enumDecodeNullable(_$CustomerStatusEnumMap, json['status']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': _$CustomerStatusEnumMap[instance.status],
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$CustomerStatusEnumMap = {
  CustomerStatus.active: 'active',
  CustomerStatus.inactive: 'inactive',
};

_CustomerCreateRequest _$CustomerCreateRequestFromJson(
  Map<String, dynamic> json,
) => _CustomerCreateRequest(
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$CustomerCreateRequestToJson(
  _CustomerCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
};

_PaginatedCustomerList _$PaginatedCustomerListFromJson(
  Map<String, dynamic> json,
) => _PaginatedCustomerList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => CustomerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedCustomerListToJson(
  _PaginatedCustomerList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
