enum UserRole {
  admin,
  serviceAdvisor,
  mechanic,
  cashier,
}

UserRole _parseUserRole(String value) {
  switch (value) {
    case 'admin':
      return UserRole.admin;
    case 'service_advisor':
      return UserRole.serviceAdvisor;
    case 'mechanic':
      return UserRole.mechanic;
    case 'cashier':
      return UserRole.cashier;
    default:
      return UserRole.admin;
  }
}

enum UserStatus {
  active,
  inactive,
}

UserStatus _parseUserStatus(String value) {
  switch (value) {
    case 'active':
      return UserStatus.active;
    case 'inactive':
      return UserStatus.inactive;
    default:
      return UserStatus.active;
  }
}

class UserModel {
  final int id;
  final String email;
  final String name;
  final String phone;
  final UserRole role;
  final String? specialization;
  final UserStatus? status;
  final bool? isActive;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    this.specialization,
    this.status,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: _parseUserRole(json['role'] as String),
      specialization: json['specialization'] as String?,
      status: json['status'] != null
          ? _parseUserStatus(json['status'] as String)
          : UserStatus.active,
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}

class UserCreateRequest {
  final String email;
  final String name;
  final String phone;
  final UserRole role;
  final String? specialization;
  final String status;
  final String password;

  UserCreateRequest({
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    this.specialization,
    this.status = 'active',
    required this.password,
  });

  factory UserCreateRequest.fromJson(Map<String, dynamic> json) {
    return UserCreateRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: _parseUserRole(json['role'] as String),
      specialization: json['specialization'] as String?,
      status: json['status'] as String? ?? 'active',
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'role': switch (role) {
        UserRole.serviceAdvisor => 'service_advisor',
        _ => role.name,
      },
      'specialization': specialization,
      'status': status,
      'password': password,
    };
  }
}

class PaginatedUserList {
  final int count;
  final String? next;
  final String? previous;
  final List<UserModel> results;

  PaginatedUserList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedUserList.fromJson(Map<String, dynamic> json) {
    return PaginatedUserList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
