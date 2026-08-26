// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QualityCheckModel _$QualityCheckModelFromJson(
  Map<String, dynamic> json,
) => _QualityCheckModel(
  id: (json['id'] as num).toInt(),
  brakeCheck: $enumDecodeNullable(_$TestDriveEnumEnumMap, json['brake_check']),
  engineCheck: $enumDecodeNullable(
    _$TestDriveEnumEnumMap,
    json['engine_check'],
  ),
  oilLeakageCheck: $enumDecodeNullable(
    _$OilLeakageCheckEnumEnumMap,
    json['oil_leakage_check'],
  ),
  acCheck: $enumDecodeNullable(_$TestDriveEnumEnumMap, json['ac_check']),
  tyreCheck: $enumDecodeNullable(_$TestDriveEnumEnumMap, json['tyre_check']),
  testDrive: $enumDecodeNullable(_$TestDriveEnumEnumMap, json['test_drive']),
  overallStatus: $enumDecodeNullable(
    _$OverallStatusEnumEnumMap,
    json['overall_status'],
  ),
  remarks: json['remarks'] as String?,
  serviceJob: (json['service_job'] as num).toInt(),
  checkedBy: (json['checked_by'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$QualityCheckModelToJson(
  _QualityCheckModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'brake_check': _$TestDriveEnumEnumMap[instance.brakeCheck],
  'engine_check': _$TestDriveEnumEnumMap[instance.engineCheck],
  'oil_leakage_check': _$OilLeakageCheckEnumEnumMap[instance.oilLeakageCheck],
  'ac_check': _$TestDriveEnumEnumMap[instance.acCheck],
  'tyre_check': _$TestDriveEnumEnumMap[instance.tyreCheck],
  'test_drive': _$TestDriveEnumEnumMap[instance.testDrive],
  'overall_status': _$OverallStatusEnumEnumMap[instance.overallStatus],
  'remarks': instance.remarks,
  'service_job': instance.serviceJob,
  'checked_by': instance.checkedBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

const _$TestDriveEnumEnumMap = {
  TestDriveEnum.passed: 'passed',
  TestDriveEnum.failed: 'failed',
  TestDriveEnum.na: 'na',
};

const _$OilLeakageCheckEnumEnumMap = {
  OilLeakageCheckEnum.noIssue: 'no_issue',
  OilLeakageCheckEnum.issueFound: 'issue_found',
  OilLeakageCheckEnum.na: 'na',
};

const _$OverallStatusEnumEnumMap = {
  OverallStatusEnum.approved: 'approved',
  OverallStatusEnum.reworkRequired: 'rework_required',
};

_QualityCheckCreateRequest _$QualityCheckCreateRequestFromJson(
  Map<String, dynamic> json,
) => _QualityCheckCreateRequest(
  brakeCheck: $enumDecode(_$TestDriveEnumEnumMap, json['brake_check']),
  engineCheck: $enumDecode(_$TestDriveEnumEnumMap, json['engine_check']),
  oilLeakageCheck: $enumDecode(
    _$OilLeakageCheckEnumEnumMap,
    json['oil_leakage_check'],
  ),
  acCheck: $enumDecode(_$TestDriveEnumEnumMap, json['ac_check']),
  tyreCheck: $enumDecode(_$TestDriveEnumEnumMap, json['tyre_check']),
  testDrive: $enumDecode(_$TestDriveEnumEnumMap, json['test_drive']),
  overallStatus: $enumDecode(
    _$OverallStatusEnumEnumMap,
    json['overall_status'],
  ),
  remarks: json['remarks'] as String?,
  serviceJob: (json['service_job'] as num).toInt(),
);

Map<String, dynamic> _$QualityCheckCreateRequestToJson(
  _QualityCheckCreateRequest instance,
) => <String, dynamic>{
  'brake_check': _$TestDriveEnumEnumMap[instance.brakeCheck]!,
  'engine_check': _$TestDriveEnumEnumMap[instance.engineCheck]!,
  'oil_leakage_check': _$OilLeakageCheckEnumEnumMap[instance.oilLeakageCheck]!,
  'ac_check': _$TestDriveEnumEnumMap[instance.acCheck]!,
  'tyre_check': _$TestDriveEnumEnumMap[instance.tyreCheck]!,
  'test_drive': _$TestDriveEnumEnumMap[instance.testDrive]!,
  'overall_status': _$OverallStatusEnumEnumMap[instance.overallStatus]!,
  'remarks': instance.remarks,
  'service_job': instance.serviceJob,
};

_PaginatedQualityCheckList _$PaginatedQualityCheckListFromJson(
  Map<String, dynamic> json,
) => _PaginatedQualityCheckList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => QualityCheckModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedQualityCheckListToJson(
  _PaginatedQualityCheckList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
