import '../../../../core/error/result.dart';
import '../../data/models/service_work_model.dart';
import '../../data/models/part_used_model.dart';

abstract class MechanicRepository {
  Future<Result<PaginatedServiceWorkList>> getWorks({int? serviceJob, int? page});
  Future<Result<ServiceWorkModel>> createWork(ServiceWorkCreateRequest request);
  Future<Result<ServiceWorkModel>> updateWorkStatus(int workId, String status);
  Future<Result<PaginatedPartUsedList>> getPartsUsed({int? serviceJob, int? page});
  Future<Result<PartUsedModel>> addPartUsed(PartUsedCreateRequest request);
  Future<Result<void>> deletePartUsed(int id);
}
