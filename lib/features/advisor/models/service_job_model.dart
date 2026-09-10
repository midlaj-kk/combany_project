enum ServiceJobStatus {
  waiting,
  inProgress,
  waitingForParts,
  qcPending,
  reworkRequired,
  readyForBill,
  readyForDelivery,
  delivered,
  cancelled;

  static ServiceJobStatus fromString(String value) {
    switch (value) {
      case 'waiting':
        return ServiceJobStatus.waiting;
      case 'in_progress':
        return ServiceJobStatus.inProgress;
      case 'waiting_for_parts':
        return ServiceJobStatus.waitingForParts;
      case 'qc_pending':
        return ServiceJobStatus.qcPending;
      case 'rework_required':
        return ServiceJobStatus.reworkRequired;
      case 'ready_for_bill':
        return ServiceJobStatus.readyForBill;
      case 'ready_for_delivery':
        return ServiceJobStatus.readyForDelivery;
      case 'delivered':
        return ServiceJobStatus.delivered;
      case 'cancelled':
        return ServiceJobStatus.cancelled;
      default:
        throw ArgumentError('Invalid ServiceJobStatus: $value');
    }
  }

  String toJsonString() {
    switch (this) {
      case ServiceJobStatus.waiting:
        return 'waiting';
      case ServiceJobStatus.inProgress:
        return 'in_progress';
      case ServiceJobStatus.waitingForParts:
        return 'waiting_for_parts';
      case ServiceJobStatus.qcPending:
        return 'qc_pending';
      case ServiceJobStatus.reworkRequired:
        return 'rework_required';
      case ServiceJobStatus.readyForBill:
        return 'ready_for_bill';
      case ServiceJobStatus.readyForDelivery:
        return 'ready_for_delivery';
      case ServiceJobStatus.delivered:
        return 'delivered';
      case ServiceJobStatus.cancelled:
        return 'cancelled';
    }
  }
}

class ServiceJobModel {
  final int id;
  final String jobNumber;
  final int vehicle;
  final String? vehicleNumber;
  final String? vehicleModel;
  final String? customerName;
  final String complaint;
  final String serviceType;
  final int? assignedMechanic;
  final String? mechanicName;
  final int? createdBy;
  final ServiceJobStatus? status;
  final int? odometerReading;
  final String? createdAt;
  final String? updatedAt;

  const ServiceJobModel({
    required this.id,
    required this.jobNumber,
    required this.vehicle,
    this.vehicleNumber,
    this.vehicleModel,
    this.customerName,
    required this.complaint,
    required this.serviceType,
    this.assignedMechanic,
    this.mechanicName,
    this.createdBy,
    this.status,
    this.odometerReading,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceJobModel.fromJson(Map<String, dynamic> json) {
    return ServiceJobModel(
      id: json['id'] as int,
      jobNumber: json['job_number'] as String,
      vehicle: json['vehicle'] as int,
      vehicleNumber: json['vehicle_number'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      customerName: json['customer_name'] as String?,
      complaint: json['complaint'] as String,
      serviceType: json['service_type'] as String,
      assignedMechanic: json['assigned_mechanic'] as int?,
      mechanicName: json['mechanic_name'] as String?,
      createdBy: json['created_by'] as int?,
      status: json['status'] != null
          ? ServiceJobStatus.fromString(json['status'] as String)
          : null,
      odometerReading: json['odometer_reading'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job_number': jobNumber,
      'vehicle': vehicle,
      'vehicle_number': vehicleNumber,
      'vehicle_model': vehicleModel,
      'customer_name': customerName,
      'complaint': complaint,
      'service_type': serviceType,
      'assigned_mechanic': assignedMechanic,
      'mechanic_name': mechanicName,
      'created_by': createdBy,
      'status': status?.toJsonString(),
      'odometer_reading': odometerReading,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class ServiceJobCreateRequest {
  final int vehicle;
  final String complaint;
  final String serviceType;
  final int? assignedMechanic;
  final int? odometerReading;

  const ServiceJobCreateRequest({
    required this.vehicle,
    required this.complaint,
    required this.serviceType,
    this.assignedMechanic,
    this.odometerReading,
  });

  factory ServiceJobCreateRequest.fromJson(Map<String, dynamic> json) {
    return ServiceJobCreateRequest(
      vehicle: json['vehicle'] as int,
      complaint: json['complaint'] as String,
      serviceType: json['service_type'] as String,
      assignedMechanic: json['assigned_mechanic'] as int?,
      odometerReading: json['odometer_reading'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'vehicle': vehicle,
      'complaint': complaint,
      'service_type': serviceType,
    };
    if (odometerReading != null) json['odometer_reading'] = odometerReading;
    return json;
  }
}

class PaginatedServiceJobList {
  final int count;
  final String? next;
  final String? previous;
  final List<ServiceJobModel> results;

  const PaginatedServiceJobList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedServiceJobList.fromJson(Map<String, dynamic> json) {
    return PaginatedServiceJobList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => ServiceJobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
