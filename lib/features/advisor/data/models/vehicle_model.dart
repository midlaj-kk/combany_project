import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

enum VehicleStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}

@freezed
abstract class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    required int id,
    @JsonKey(name: 'vehicle_number') required String vehicleNumber,
    required String brand,
    required String model,
    int? year,
    @Default(0) int kilometers,
    VehicleStatus? status,
    int? customer,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}

@freezed
abstract class VehicleCreateRequest with _$VehicleCreateRequest {
  const factory VehicleCreateRequest({
    @JsonKey(name: 'vehicle_number') required String vehicleNumber,
    required String brand,
    required String model,
    int? year,
    @Default(0) int kilometers,
    required int customer,
  }) = _VehicleCreateRequest;

  factory VehicleCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$VehicleCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedVehicleList with _$PaginatedVehicleList {
  const factory PaginatedVehicleList({
    required int count,
    String? next,
    String? previous,
    required List<VehicleModel> results,
  }) = _PaginatedVehicleList;

  factory PaginatedVehicleList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedVehicleListFromJson(json);
}
