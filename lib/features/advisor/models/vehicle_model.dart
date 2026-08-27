enum VehicleStatus {
  active,
  inactive;

  static VehicleStatus fromString(String value) {
    switch (value) {
      case 'active':
        return VehicleStatus.active;
      case 'inactive':
        return VehicleStatus.inactive;
      default:
        throw ArgumentError('Invalid VehicleStatus: $value');
    }
  }

  String toJsonString() {
    switch (this) {
      case VehicleStatus.active:
        return 'active';
      case VehicleStatus.inactive:
        return 'inactive';
    }
  }
}

class VehicleModel {
  final int id;
  final String vehicleNumber;
  final String brand;
  final String model;
  final int? year;
  final int kilometers;
  final VehicleStatus? status;
  final int? customer;
  final String? createdAt;
  final String? updatedAt;

  const VehicleModel({
    required this.id,
    required this.vehicleNumber,
    required this.brand,
    required this.model,
    this.year,
    this.kilometers = 0,
    this.status,
    this.customer,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as int,
      vehicleNumber: json['vehicle_number'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int?,
      kilometers: (json['kilometers'] as num?)?.toInt() ?? 0,
      status: json['status'] != null
          ? VehicleStatus.fromString(json['status'] as String)
          : null,
      customer: json['customer'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_number': vehicleNumber,
      'brand': brand,
      'model': model,
      'year': year,
      'kilometers': kilometers,
      'status': status?.toJsonString(),
      'customer': customer,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class VehicleCreateRequest {
  final String vehicleNumber;
  final String brand;
  final String model;
  final int? year;
  final int kilometers;
  final int customer;

  const VehicleCreateRequest({
    required this.vehicleNumber,
    required this.brand,
    required this.model,
    this.year,
    this.kilometers = 0,
    required this.customer,
  });

  factory VehicleCreateRequest.fromJson(Map<String, dynamic> json) {
    return VehicleCreateRequest(
      vehicleNumber: json['vehicle_number'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int?,
      kilometers: (json['kilometers'] as num?)?.toInt() ?? 0,
      customer: json['customer'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicle_number': vehicleNumber,
      'brand': brand,
      'model': model,
      'year': year,
      'kilometers': kilometers,
      'customer': customer,
    };
  }
}

class PaginatedVehicleList {
  final int count;
  final String? next;
  final String? previous;
  final List<VehicleModel> results;

  const PaginatedVehicleList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedVehicleList.fromJson(Map<String, dynamic> json) {
    return PaginatedVehicleList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
