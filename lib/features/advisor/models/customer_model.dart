enum CustomerStatus {
  active,
  inactive;

  static CustomerStatus fromString(String value) {
    switch (value) {
      case 'active':
        return CustomerStatus.active;
      case 'inactive':
        return CustomerStatus.inactive;
      default:
        throw ArgumentError('Invalid CustomerStatus: $value');
    }
  }

  String toJsonString() {
    switch (this) {
      case CustomerStatus.active:
        return 'active';
      case CustomerStatus.inactive:
        return 'inactive';
    }
  }
}

class CustomerModel {
  final int id;
  final String name;
  final String phone;
  final String? email;
  final String? address;
  final CustomerStatus? status;
  final String? createdAt;
  final String? updatedAt;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.address,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      status: json['status'] != null
          ? CustomerStatus.fromString(json['status'] as String)
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'status': status?.toJsonString(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class CustomerCreateRequest {
  final String name;
  final String phone;
  final String? email;
  final String? address;

  const CustomerCreateRequest({
    required this.name,
    required this.phone,
    this.email,
    this.address,
  });

  factory CustomerCreateRequest.fromJson(Map<String, dynamic> json) {
    return CustomerCreateRequest(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}

class PaginatedCustomerList {
  final int count;
  final String? next;
  final String? previous;
  final List<CustomerModel> results;

  const PaginatedCustomerList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedCustomerList.fromJson(Map<String, dynamic> json) {
    return PaginatedCustomerList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => CustomerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
