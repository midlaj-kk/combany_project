
enum ServiceWorkStatus {
  pending,
  inProgress,
  completed;

  factory ServiceWorkStatus.fromString(String value) {
    return switch (value) {
      'pending' => ServiceWorkStatus.pending,
      'in_progress' => ServiceWorkStatus.inProgress,
      'completed' => ServiceWorkStatus.completed,
      _ => throw ArgumentError('Unknown ServiceWorkStatus: $value'),
    };
  }

  String toJson() {
    return switch (this) {
      ServiceWorkStatus.inProgress => 'in_progress',
      _ => name,
    };
  }
}

class ServiceWorkModel {
  final int id;
  final String workName;
  final String? description;
  final ServiceWorkStatus? status;
  final String? labourCharge;
  final int serviceJob;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;

  const ServiceWorkModel({
    required this.id,
    required this.workName,
    this.description,
    this.status,
    this.labourCharge,
    required this.serviceJob,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceWorkModel.fromJson(Map<String, dynamic> json) {
    return ServiceWorkModel(
      id: json['id'] as int,
      workName: json['work_name'] as String,
      description: json['description'] as String?,
      status: json['status'] != null
          ? ServiceWorkStatus.fromString(json['status'] as String)
          : null,
      labourCharge: json['labour_charge'] as String?,
      serviceJob: json['service_job'] as int,
      createdBy: json['created_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class ServiceWorkCreateRequest {
  final String workName;
  final String? description;
  final String? labourCharge;
  final int serviceJob;

  const ServiceWorkCreateRequest({
    required this.workName,
    this.description,
    this.labourCharge,
    required this.serviceJob,
  });

  factory ServiceWorkCreateRequest.fromJson(Map<String, dynamic> json) {
    return ServiceWorkCreateRequest(
      workName: json['work_name'] as String,
      description: json['description'] as String?,
      labourCharge: json['labour_charge'] as String?,
      serviceJob: json['service_job'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'work_name': workName,
      'description': description,
      'labour_charge': labourCharge,
      'service_job': serviceJob,
    };
  }
}

class PaginatedServiceWorkList {
  final int count;
  final String? next;
  final String? previous;
  final List<ServiceWorkModel> results;

  const PaginatedServiceWorkList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedServiceWorkList.fromJson(Map<String, dynamic> json) {
    return PaginatedServiceWorkList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ServiceWorkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
