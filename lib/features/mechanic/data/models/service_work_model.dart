import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_work_model.freezed.dart';
part 'service_work_model.g.dart';

enum ServiceWorkStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
}

@freezed
abstract class ServiceWorkModel with _$ServiceWorkModel {
  const factory ServiceWorkModel({
    required int id,
    @JsonKey(name: 'work_name') required String workName,
    String? description,
    ServiceWorkStatus? status,
    @JsonKey(name: 'labour_charge') String? labourCharge,
    @JsonKey(name: 'service_job') required int serviceJob,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ServiceWorkModel;

  factory ServiceWorkModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceWorkModelFromJson(json);
}

@freezed
abstract class ServiceWorkCreateRequest with _$ServiceWorkCreateRequest {
  const factory ServiceWorkCreateRequest({
    @JsonKey(name: 'work_name') required String workName,
    String? description,
    @JsonKey(name: 'labour_charge') String? labourCharge,
    @JsonKey(name: 'service_job') required int serviceJob,
  }) = _ServiceWorkCreateRequest;

  factory ServiceWorkCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceWorkCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedServiceWorkList with _$PaginatedServiceWorkList {
  const factory PaginatedServiceWorkList({
    required int count,
    String? next,
    String? previous,
    required List<ServiceWorkModel> results,
  }) = _PaginatedServiceWorkList;

  factory PaginatedServiceWorkList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedServiceWorkListFromJson(json);
}
