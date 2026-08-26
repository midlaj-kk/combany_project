import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

enum CustomerStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required int id,
    required String name,
    required String phone,
    String? email,
    String? address,
    CustomerStatus? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

@freezed
abstract class CustomerCreateRequest with _$CustomerCreateRequest {
  const factory CustomerCreateRequest({
    required String name,
    required String phone,
    String? email,
    String? address,
  }) = _CustomerCreateRequest;

  factory CustomerCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedCustomerList with _$PaginatedCustomerList {
  const factory PaginatedCustomerList({
    required int count,
    String? next,
    String? previous,
    required List<CustomerModel> results,
  }) = _PaginatedCustomerList;

  factory PaginatedCustomerList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCustomerListFromJson(json);
}
