// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  specialization: json['specialization'] as String?,
  status:
      $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
      UserStatus.active,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'specialization': instance.specialization,
      'status': _$UserStatusEnumMap[instance.status],
      'isActive': instance.isActive,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.serviceAdvisor: 'service_advisor',
  UserRole.mechanic: 'mechanic',
  UserRole.cashier: 'cashier',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.inactive: 'inactive',
};

_UserCreateRequest _$UserCreateRequestFromJson(Map<String, dynamic> json) =>
    _UserCreateRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      specialization: json['specialization'] as String?,
      status: json['status'] as String? ?? 'active',
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreateRequestToJson(_UserCreateRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'specialization': instance.specialization,
      'status': instance.status,
      'password': instance.password,
    };

_PaginatedUserList _$PaginatedUserListFromJson(Map<String, dynamic> json) =>
    _PaginatedUserList(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedUserListToJson(_PaginatedUserList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
