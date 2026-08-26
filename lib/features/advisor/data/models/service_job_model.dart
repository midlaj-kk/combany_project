import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_job_model.freezed.dart';
part 'service_job_model.g.dart';

enum ServiceJobStatus {
  @JsonValue('waiting')
  waiting,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('waiting_for_parts')
  waitingForParts,
  @JsonValue('qc_pending')
  qcPending,
  @JsonValue('rework_required')
  reworkRequired,
  @JsonValue('ready_for_bill')
  readyForBill,
  @JsonValue('ready_for_delivery')
  readyForDelivery,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
abstract class ServiceJobModel with _$ServiceJobModel {
  const factory ServiceJobModel({
    required int id,
    @JsonKey(name: 'job_number') required String jobNumber,
    required int vehicle,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    required String complaint,
    @JsonKey(name: 'service_type') required String serviceType,
    @JsonKey(name: 'assigned_mechanic') int? assignedMechanic,
    @JsonKey(name: 'mechanic_name') String? mechanicName,
    @JsonKey(name: 'created_by') int? createdBy,
    ServiceJobStatus? status,
    @JsonKey(name: 'odometer_reading') int? odometerReading,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ServiceJobModel;

  factory ServiceJobModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceJobModelFromJson(json);
}

@freezed
abstract class ServiceJobCreateRequest with _$ServiceJobCreateRequest {
  const factory ServiceJobCreateRequest({
    required int vehicle,
    required String complaint,
    @JsonKey(name: 'service_type') required String serviceType,
    @JsonKey(name: 'assigned_mechanic') int? assignedMechanic,
    @JsonKey(name: 'odometer_reading') int? odometerReading,
  }) = _ServiceJobCreateRequest;

  factory ServiceJobCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceJobCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedServiceJobList with _$PaginatedServiceJobList {
  const factory PaginatedServiceJobList({
    required int count,
    String? next,
    String? previous,
    required List<ServiceJobModel> results,
  }) = _PaginatedServiceJobList;

  factory PaginatedServiceJobList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedServiceJobListFromJson(json);
}
