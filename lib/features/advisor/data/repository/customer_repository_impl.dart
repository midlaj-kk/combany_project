import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasources/advisor_service.dart';
import '../models/customer_model.dart';
import '../models/vehicle_model.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final AdvisorService service;
  CustomerRepositoryImpl({required this.service});

  String _serverMessage(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.message ?? fallback;
  }

  @override
  Future<Result<PaginatedCustomerList>> getCustomers({String? search, int? page}) async {
    try {
      final result = await service.getCustomers(search: search, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load customers'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<CustomerModel>> getCustomer(int id) async {
    try {
      final result = await service.getCustomer(id);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load customer'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<CustomerModel>> createCustomer(CustomerCreateRequest request) async {
    try {
      final result = await service.createCustomer(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to create customer'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<VehicleModel>>> getCustomerVehicles(int customerId) async {
    try {
      final result = await service.getCustomerVehicles(customerId);
      final vehicles = result
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Success(vehicles);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load vehicles'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<Map<int, int>>> getVehicleCounts() async {
    try {
      final vehicles = await service.getAllVehicles();
      final counts = <int, int>{};
      for (final vehicle in vehicles) {
        final customerId = vehicle.customer;
        if (customerId != null) {
          counts[customerId] = (counts[customerId] ?? 0) + 1;
        }
      }
      return Success(counts);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load vehicle counts'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}

