import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/mechanic_repository.dart';
import '../datasources/mechanic_service.dart';
import '../models/service_work_model.dart';
import '../models/part_used_model.dart';

class MechanicRepositoryImpl implements MechanicRepository {
  final MechanicService service;
  MechanicRepositoryImpl({required this.service});

  @override
  Future<Result<PaginatedServiceWorkList>> getWorks({int? serviceJob, int? page}) async {
    try {
      final result = await service.getWorks(serviceJob: serviceJob, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load works');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceWorkModel>> createWork(ServiceWorkCreateRequest request) async {
    try {
      final result = await service.createWork(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create work');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceWorkModel>> updateWorkStatus(int workId, String status) async {
    try {
      final result = await service.updateWorkStatus(workId, status);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to update work status');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<PaginatedPartUsedList>> getPartsUsed({int? serviceJob, int? page}) async {
    try {
      final result = await service.getPartsUsed(serviceJob: serviceJob, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load parts used');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<PartUsedModel>> addPartUsed(PartUsedCreateRequest request) async {
    try {
      final result = await service.addPartUsed(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to add part used');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> deletePartUsed(int id) async {
    try {
      await service.deletePartUsed(id);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to delete part used');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}
