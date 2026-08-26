import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_check_model.freezed.dart';
part 'quality_check_model.g.dart';

enum TestDriveEnum {
  @JsonValue('passed')
  passed,
  @JsonValue('failed')
  failed,
  @JsonValue('na')
  na,
}

enum OilLeakageCheckEnum {
  @JsonValue('no_issue')
  noIssue,
  @JsonValue('issue_found')
  issueFound,
  @JsonValue('na')
  na,
}

enum OverallStatusEnum {
  @JsonValue('approved')
  approved,
  @JsonValue('rework_required')
  reworkRequired,
}

@freezed
abstract class QualityCheckModel with _$QualityCheckModel {
  const factory QualityCheckModel({
    required int id,
    @JsonKey(name: 'brake_check') TestDriveEnum? brakeCheck,
    @JsonKey(name: 'engine_check') TestDriveEnum? engineCheck,
    @JsonKey(name: 'oil_leakage_check') OilLeakageCheckEnum? oilLeakageCheck,
    @JsonKey(name: 'ac_check') TestDriveEnum? acCheck,
    @JsonKey(name: 'tyre_check') TestDriveEnum? tyreCheck,
    @JsonKey(name: 'test_drive') TestDriveEnum? testDrive,
    @JsonKey(name: 'overall_status') OverallStatusEnum? overallStatus,
    String? remarks,
    @JsonKey(name: 'service_job') required int serviceJob,
    @JsonKey(name: 'checked_by') int? checkedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _QualityCheckModel;

  factory QualityCheckModel.fromJson(Map<String, dynamic> json) =>
      _$QualityCheckModelFromJson(json);
}

@freezed
abstract class QualityCheckCreateRequest with _$QualityCheckCreateRequest {
  const factory QualityCheckCreateRequest({
    @JsonKey(name: 'brake_check') required TestDriveEnum brakeCheck,
    @JsonKey(name: 'engine_check') required TestDriveEnum engineCheck,
    @JsonKey(name: 'oil_leakage_check') required OilLeakageCheckEnum oilLeakageCheck,
    @JsonKey(name: 'ac_check') required TestDriveEnum acCheck,
    @JsonKey(name: 'tyre_check') required TestDriveEnum tyreCheck,
    @JsonKey(name: 'test_drive') required TestDriveEnum testDrive,
    @JsonKey(name: 'overall_status') required OverallStatusEnum overallStatus,
    String? remarks,
    @JsonKey(name: 'service_job') required int serviceJob,
  }) = _QualityCheckCreateRequest;

  factory QualityCheckCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$QualityCheckCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedQualityCheckList with _$PaginatedQualityCheckList {
  const factory PaginatedQualityCheckList({
    required int count,
    String? next,
    String? previous,
    required List<QualityCheckModel> results,
  }) = _PaginatedQualityCheckList;

  factory PaginatedQualityCheckList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedQualityCheckListFromJson(json);
}
