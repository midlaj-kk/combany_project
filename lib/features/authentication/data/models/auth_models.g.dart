// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    _TokenResponse(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$TokenResponseToJson(_TokenResponse instance) =>
    <String, dynamic>{'access': instance.access, 'refresh': instance.refresh};

_RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) =>
    _RefreshRequest(refresh: json['refresh'] as String);

Map<String, dynamic> _$RefreshRequestToJson(_RefreshRequest instance) =>
    <String, dynamic>{'refresh': instance.refresh};

_RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    _RefreshResponse(access: json['access'] as String);

Map<String, dynamic> _$RefreshResponseToJson(_RefreshResponse instance) =>
    <String, dynamic>{'access': instance.access};

_LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) =>
    _LogoutRequest(refresh: json['refresh'] as String);

Map<String, dynamic> _$LogoutRequestToJson(_LogoutRequest instance) =>
    <String, dynamic>{'refresh': instance.refresh};
