import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/job_repository.dart';
import '../datasources/advisor_service.dart';
import '../models/service_job_model.dart';

class JobRepositoryImpl implements JobRepository {
  final AdvisorService service;
  JobRepositoryImpl({required this.service});

  String _serverMessage(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.message ?? fallback;
  }

  @override
  Future<Result<PaginatedServiceJobList>> getJobs({
    String? status,
    int? assignedMechanic,
    String? search,
    int? page,
  }) async {
    try {
      final result = await service.getJobs(
        status: status,
        assignedMechanic: assignedMechanic,
        search: search,
        page: page,
      );
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load jobs'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceJobModel>> getJob(int id) async {
    try {
      final result = await service.getJob(id);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to load job'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceJobModel>> createJob(ServiceJobCreateRequest request) async {
    try {
      final result = await service.createJob(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to create job'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceJobModel>> assignMechanic(int jobId, int mechanicId) async {
    try {
      final result = await service.assignMechanic(jobId, mechanicId);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to assign mechanic'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceJobModel>> changeMechanic(int jobId, int mechanicId) async {
    try {
      final result = await service.changeMechanic(jobId, mechanicId);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to change mechanic'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<ServiceJobModel>> updateJobStatus(int jobId, String status) async {
    try {
      final result = await service.updateJobStatus(jobId, status);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(_serverMessage(e, 'Failed to update job status'));
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}
