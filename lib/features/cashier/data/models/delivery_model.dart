import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

@freezed
abstract class DeliveryModel with _$DeliveryModel {
  const factory DeliveryModel({
    required int id,
    @JsonKey(name: 'delivery_date') String? deliveryDate,
    @JsonKey(name: 'customer_received') bool? customerReceived,
    String? remarks,
    @JsonKey(name: 'service_job') required int serviceJob,
    @JsonKey(name: 'delivered_by') int? deliveredBy,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}

@freezed
abstract class DeliveryCreateRequest with _$DeliveryCreateRequest {
  const factory DeliveryCreateRequest({
    @JsonKey(name: 'delivery_date') required String deliveryDate,
    @JsonKey(name: 'customer_received') bool? customerReceived,
    String? remarks,
    @JsonKey(name: 'service_job') required int serviceJob,
  }) = _DeliveryCreateRequest;

  factory DeliveryCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedDeliveryList with _$PaginatedDeliveryList {
  const factory PaginatedDeliveryList({
    required int count,
    String? next,
    String? previous,
    required List<DeliveryModel> results,
  }) = _PaginatedDeliveryList;

  factory PaginatedDeliveryList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDeliveryListFromJson(json);
}
