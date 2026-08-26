import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('service_advisor')
  serviceAdvisor,
  @JsonValue('mechanic')
  mechanic,
  @JsonValue('cashier')
  cashier,
}

enum UserStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required String name,
    required String phone,
    required UserRole role,
    String? specialization,
    @Default(UserStatus.active) UserStatus? status,
    @Default(true) bool? isActive,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserCreateRequest with _$UserCreateRequest {
  const factory UserCreateRequest({
    required String email,
    required String name,
    required String phone,
    required UserRole role,
    String? specialization,
    @Default('active') String status,
    required String password,
  }) = _UserCreateRequest;

  factory UserCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedUserList with _$PaginatedUserList {
  const factory PaginatedUserList({
    required int count,
    String? next,
    String? previous,
    required List<UserModel> results,
  }) = _PaginatedUserList;

  factory PaginatedUserList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUserListFromJson(json);
}
