import '../../../../core/error/result.dart';
import '../../data/models/service_job_model.dart';

abstract class JobRepository {
  Future<Result<PaginatedServiceJobList>> getJobs({String? status, int? assignedMechanic, String? search, int? page});
  Future<Result<ServiceJobModel>> getJob(int id);
  Future<Result<ServiceJobModel>> createJob(ServiceJobCreateRequest request);
  Future<Result<ServiceJobModel>> assignMechanic(int jobId, int mechanicId);
  Future<Result<ServiceJobModel>> changeMechanic(int jobId, int mechanicId);
  Future<Result<ServiceJobModel>> updateJobStatus(int jobId, String status);
}
