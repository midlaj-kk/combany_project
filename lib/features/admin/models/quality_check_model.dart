enum TestDriveEnum {
  passed,
  failed,
  na,
}

TestDriveEnum _parseTestDriveEnum(String value) {
  switch (value) {
    case 'passed':
      return TestDriveEnum.passed;
    case 'failed':
      return TestDriveEnum.failed;
    case 'na':
      return TestDriveEnum.na;
    default:
      return TestDriveEnum.na;
  }
}

enum OilLeakageCheckEnum {
  noIssue,
  issueFound,
  na,
}

OilLeakageCheckEnum _parseOilLeakageCheckEnum(String value) {
  switch (value) {
    case 'no_issue':
      return OilLeakageCheckEnum.noIssue;
    case 'issue_found':
      return OilLeakageCheckEnum.issueFound;
    case 'na':
      return OilLeakageCheckEnum.na;
    default:
      return OilLeakageCheckEnum.na;
  }
}

enum OverallStatusEnum {
  approved,
  reworkRequired,
}

OverallStatusEnum _parseOverallStatusEnum(String value) {
  switch (value) {
    case 'approved':
      return OverallStatusEnum.approved;
    case 'rework_required':
      return OverallStatusEnum.reworkRequired;
    default:
      return OverallStatusEnum.approved;
  }
}

class QualityCheckModel {
  final int id;
  final TestDriveEnum? brakeCheck;
  final TestDriveEnum? engineCheck;
  final OilLeakageCheckEnum? oilLeakageCheck;
  final TestDriveEnum? acCheck;
  final TestDriveEnum? tyreCheck;
  final TestDriveEnum? testDrive;
  final OverallStatusEnum? overallStatus;
  final String? remarks;
  final int serviceJob;
  final int? checkedBy;
  final String? createdAt;
  final String? updatedAt;

  QualityCheckModel({
    required this.id,
    this.brakeCheck,
    this.engineCheck,
    this.oilLeakageCheck,
    this.acCheck,
    this.tyreCheck,
    this.testDrive,
    this.overallStatus,
    this.remarks,
    required this.serviceJob,
    this.checkedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory QualityCheckModel.fromJson(Map<String, dynamic> json) {
    return QualityCheckModel(
      id: json['id'] as int,
      brakeCheck: json['brake_check'] != null
          ? _parseTestDriveEnum(json['brake_check'] as String)
          : null,
      engineCheck: json['engine_check'] != null
          ? _parseTestDriveEnum(json['engine_check'] as String)
          : null,
      oilLeakageCheck: json['oil_leakage_check'] != null
          ? _parseOilLeakageCheckEnum(json['oil_leakage_check'] as String)
          : null,
      acCheck: json['ac_check'] != null
          ? _parseTestDriveEnum(json['ac_check'] as String)
          : null,
      tyreCheck: json['tyre_check'] != null
          ? _parseTestDriveEnum(json['tyre_check'] as String)
          : null,
      testDrive: json['test_drive'] != null
          ? _parseTestDriveEnum(json['test_drive'] as String)
          : null,
      overallStatus: json['overall_status'] != null
          ? _parseOverallStatusEnum(json['overall_status'] as String)
          : null,
      remarks: json['remarks'] as String?,
      serviceJob: json['service_job'] as int,
      checkedBy: json['checked_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class QualityCheckCreateRequest {
  final TestDriveEnum brakeCheck;
  final TestDriveEnum engineCheck;
  final OilLeakageCheckEnum oilLeakageCheck;
  final TestDriveEnum acCheck;
  final TestDriveEnum tyreCheck;
  final TestDriveEnum testDrive;
  final OverallStatusEnum overallStatus;
  final String? remarks;
  final int serviceJob;

  QualityCheckCreateRequest({
    required this.brakeCheck,
    required this.engineCheck,
    required this.oilLeakageCheck,
    required this.acCheck,
    required this.tyreCheck,
    required this.testDrive,
    required this.overallStatus,
    this.remarks,
    required this.serviceJob,
  });

  factory QualityCheckCreateRequest.fromJson(Map<String, dynamic> json) {
    return QualityCheckCreateRequest(
      brakeCheck: _parseTestDriveEnum(json['brake_check'] as String),
      engineCheck: _parseTestDriveEnum(json['engine_check'] as String),
      oilLeakageCheck:
          _parseOilLeakageCheckEnum(json['oil_leakage_check'] as String),
      acCheck: _parseTestDriveEnum(json['ac_check'] as String),
      tyreCheck: _parseTestDriveEnum(json['tyre_check'] as String),
      testDrive: _parseTestDriveEnum(json['test_drive'] as String),
      overallStatus: _parseOverallStatusEnum(json['overall_status'] as String),
      remarks: json['remarks'] as String?,
      serviceJob: json['service_job'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    String testDriveEnumToJson(TestDriveEnum e) => e.name;
    String oilLeakageCheckEnumToJson(OilLeakageCheckEnum e) => e.name;
    String overallStatusEnumToJson(OverallStatusEnum e) {
      return switch (e) {
        OverallStatusEnum.reworkRequired => 'rework_required',
        _ => e.name,
      };
    }
    return {
      'brake_check': testDriveEnumToJson(brakeCheck),
      'engine_check': testDriveEnumToJson(engineCheck),
      'oil_leakage_check': oilLeakageCheckEnumToJson(oilLeakageCheck),
      'ac_check': testDriveEnumToJson(acCheck),
      'tyre_check': testDriveEnumToJson(tyreCheck),
      'test_drive': testDriveEnumToJson(testDrive),
      'overall_status': overallStatusEnumToJson(overallStatus),
      'remarks': remarks,
      'service_job': serviceJob,
    };
  }
}

class PaginatedQualityCheckList {
  final int count;
  final String? next;
  final String? previous;
  final List<QualityCheckModel> results;

  PaginatedQualityCheckList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedQualityCheckList.fromJson(Map<String, dynamic> json) {
    return PaginatedQualityCheckList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => QualityCheckModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
