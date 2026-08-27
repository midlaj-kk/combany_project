import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/customer_model.dart';
import '../models/vehicle_model.dart';
import '../models/service_job_model.dart';

class AdvisorService {
  final Dio dio;

  AdvisorService({required this.dio});

  // ── Customers ────────────────────────────────────────────────────────────

  Future<PaginatedCustomerList> getCustomers({String? search, int? page, int? pageSize}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.customers,
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        return PaginatedCustomerList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load customers (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<CustomerModel> getCustomer(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.customerById(id));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        return CustomerModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load customer (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<CustomerModel> createCustomer(CustomerCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.customers,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = _unwrap(response.data);
        return CustomerModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create customer (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<dynamic>> getCustomerVehicles(int customerId) async {
    try {
      final response = await dio.get(ApiEndpoints.customerVehicles(customerId));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is List) return data;
        if (data is Map && data.containsKey('results')) {
          return (data['results'] as List<dynamic>?) ?? [];
        }
        return [];
      } else {
        throw Exception('Failed to load customer vehicles (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Vehicles ─────────────────────────────────────────────────────────────

  Future<VehicleModel> getVehicle(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.vehicleById(id));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        return VehicleModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load vehicle (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<VehicleModel>> getAllVehicles() async {
    try {
      final vehicles = <VehicleModel>[];
      String? next = ApiEndpoints.vehicles;

      while (next != null) {
        final response = await dio.get(next);

        if (response.statusCode != 200) {
          throw Exception('Failed to load vehicles (status: ${response.statusCode})');
        }

        final data = _unwrap(response.data);
        final page = PaginatedVehicleList.fromJson(data as Map<String, dynamic>);
        vehicles.addAll(page.results);
        next = page.next;
      }

      return vehicles;
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<VehicleModel> createVehicle(VehicleCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.vehicles,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = _unwrap(response.data);
        return VehicleModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create vehicle (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<dynamic>> getVehicleHistory(int vehicleId) async {
    try {
      final response = await dio.get(ApiEndpoints.vehicleHistoryById(vehicleId));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is List) return data;
        if (data is Map && data.containsKey('results')) {
          return (data['results'] as List<dynamic>?) ?? [];
        }
        return [];
      } else {
        throw Exception('Failed to load vehicle history (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Service Jobs ─────────────────────────────────────────────────────────

  Future<PaginatedServiceJobList> getJobs({
    String? status,
    int? assignedMechanic,
    String? search,
    int? page,
    int? pageSize,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.serviceJobs,
        queryParameters: {
          if (status != null && status.isNotEmpty) 'status': status,
          if (assignedMechanic != null) 'assigned_mechanic': assignedMechanic,
          if (search != null && search.isNotEmpty) 'search': search,
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        return PaginatedServiceJobList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load service jobs (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceJobModel> getJob(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.serviceJobById(id));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        return ServiceJobModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load service job (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceJobModel> createJob(ServiceJobCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.serviceJobs,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = _unwrap(response.data);
        return ServiceJobModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create service job (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceJobModel> assignMechanic(int jobId, int mechanicId) async {
    try {
      final response = await dio.patch(
        ApiEndpoints.assignMechanic(jobId),
        data: {'mechanic_id': mechanicId},
      );

      if (response.statusCode == 200) {
        return await getJob(jobId);
      } else {
        throw Exception('Failed to assign mechanic (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceJobModel> changeMechanic(int jobId, int mechanicId) async {
    try {
      final response = await dio.patch(
        ApiEndpoints.changeMechanic(jobId),
        data: {'mechanic_id': mechanicId},
      );

      if (response.statusCode == 200) {
        return await getJob(jobId);
      } else {
        throw Exception('Failed to change mechanic (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceJobModel> updateJobStatus(int jobId, String status) async {
    try {
      final response = await dio.patch(
        ApiEndpoints.serviceJobStatus(jobId),
        data: {'status': status},
      );

      if (response.statusCode == 200) {
        return await getJob(jobId);
      } else {
        throw Exception('Failed to update job status (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Helper ───────────────────────────────────────────────────────────────

  /// Some backend endpoints wrap payloads in {"success":..,"message":..,"data":..}
  /// while others return the object directly. This extracts the actual data.
  static dynamic _unwrap(dynamic data) {
    if (data is Map<String, dynamic> &&
        data.containsKey('success') &&
        data.containsKey('data')) {
      return data['data'];
    }
    return data;
  }

  String _getErrorMessage(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;

      if (data is Map && data.containsKey('detail')) {
        return data['detail'].toString();
      }
      if (data is Map && data.containsKey('message')) {
        return data['message'].toString();
      }
      return 'Server error ($statusCode). Please try again.';
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Connection timed out. Please check your internet.';
    }

    if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection. Please try again.';
    }

    return 'Something went wrong. Please try again.';
  }
}
