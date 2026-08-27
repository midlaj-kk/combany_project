import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/customer_model.dart';
import '../models/vehicle_model.dart';
import '../models/service_job_model.dart';

class AdvisorService {
  final Dio dio;
  AdvisorService({required this.dio});

  /// Some backend endpoints wrap payloads in {"success":..,"message":..,"data":..}
  /// while others return the object directly. This normalizes both.
  static dynamic _unwrap(dynamic data) {
    if (data is Map<String, dynamic> &&
        data.containsKey('success') &&
        data.containsKey('data')) {
      return data['data'];
    }
    return data;
  }

  // ── Customers ────────────────────────────────────────────────────────────
  Future<PaginatedCustomerList> getCustomers({String? search, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.customers,
      queryParameters: {
        if (search != null && search.isNotEmpty) 'search': search,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedCustomerList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<CustomerModel> getCustomer(int id) async {
    final response = await dio.get(ApiEndpoints.customerById(id));
    return CustomerModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<CustomerModel> createCustomer(CustomerCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.customers,
      data: request.toJson(),
    );
    return CustomerModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<dynamic>> getCustomerVehicles(int customerId) async {
    final response = await dio.get(ApiEndpoints.customerVehicles(customerId));
    return _unwrap(response.data) as List<dynamic>;
  }

  // ── Vehicles ─────────────────────────────────────────────────────────────
  Future<VehicleModel> getVehicle(int id) async {
    final response = await dio.get(ApiEndpoints.vehicleById(id));
    return VehicleModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<VehicleModel>> getAllVehicles() async {
    final vehicles = <VehicleModel>[];
    String? next = ApiEndpoints.vehicles;
    while (next != null) {
      final response = await dio.get(next);
      final page = PaginatedVehicleList.fromJson(
          response.data as Map<String, dynamic>);
      vehicles.addAll(page.results);
      next = page.next;
    }
    return vehicles;
  }

  Future<VehicleModel> createVehicle(VehicleCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.vehicles,
      data: request.toJson(),
    );
    return VehicleModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<dynamic>> getVehicleHistory(int vehicleId) async {
    final response = await dio.get(ApiEndpoints.vehicleHistoryById(vehicleId));
    return _unwrap(response.data) as List<dynamic>;
  }

  // ── Service Jobs ─────────────────────────────────────────────────────────
  Future<PaginatedServiceJobList> getJobs({
    String? status,
    int? assignedMechanic,
    String? search,
    int? page,
    int? pageSize,
  }) async {
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
    return PaginatedServiceJobList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ServiceJobModel> getJob(int id) async {
    final response = await dio.get(ApiEndpoints.serviceJobById(id));
    return ServiceJobModel.fromJson(_unwrap(response.data) as Map<String, dynamic>);
  }

  Future<ServiceJobModel> createJob(ServiceJobCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.serviceJobs,
      data: request.toJson(),
    );
    return ServiceJobModel.fromJson(
        _unwrap(response.data) as Map<String, dynamic>);
  }

  Future<ServiceJobModel> assignMechanic(int jobId, int mechanicId) async {
    final response = await dio.patch(
      ApiEndpoints.assignMechanic(jobId),
      data: {'mechanic_id': mechanicId},
    );
    _unwrap(response.data);
    return await getJob(jobId);
  }

  Future<ServiceJobModel> changeMechanic(int jobId, int mechanicId) async {
    final response = await dio.patch(
      ApiEndpoints.changeMechanic(jobId),
      data: {'mechanic_id': mechanicId},
    );
    _unwrap(response.data);
    return await getJob(jobId);
  }

  Future<ServiceJobModel> updateJobStatus(int jobId, String status) async {
    final response = await dio.patch(
      ApiEndpoints.serviceJobStatus(jobId),
      data: {'status': status},
    );
    _unwrap(response.data);
    return await getJob(jobId);
  }
}
