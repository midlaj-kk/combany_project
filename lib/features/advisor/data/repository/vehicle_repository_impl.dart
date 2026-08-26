import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../datasources/advisor_service.dart';
import '../models/vehicle_model.dart';
import '../models/service_job_model.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final AdvisorService service;
  VehicleRepositoryImpl({required this.service});

  @override
  Future<Result<VehicleModel>> getVehicle(int id) async {
    try {
      final result = await service.getVehicle(id);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load vehicle');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<VehicleModel>> createVehicle(VehicleCreateRequest request) async {
    try {
      final result = await service.createVehicle(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create vehicle');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<ServiceJobModel>>> getVehicleHistory(int vehicleId) async {
    try {
      final result = await service.getVehicleHistory(vehicleId);
      final jobs = result
          .map((e) => ServiceJobModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Success(jobs);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load vehicle history');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}
