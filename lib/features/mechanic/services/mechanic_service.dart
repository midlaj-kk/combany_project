import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/service_work_model.dart';
import '../models/part_used_model.dart';

class MechanicService {
  final Dio dio;
  MechanicService({required this.dio});

  // ── Service Works ────────────────────────────────────────────────────────
  Future<PaginatedServiceWorkList> getWorks({int? serviceJob, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.works,
      queryParameters: {
        if (serviceJob != null) 'service_job': serviceJob,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedServiceWorkList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ServiceWorkModel> createWork(ServiceWorkCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.works,
      data: request.toJson(),
    );
    return ServiceWorkModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ServiceWorkModel> updateWorkStatus(int workId, String status) async {
    final response = await dio.post(
      ApiEndpoints.workStatus(workId),
      data: {'status': status},
    );
    return ServiceWorkModel.fromJson(response.data as Map<String, dynamic>);
  }

  // ── Parts Used ───────────────────────────────────────────────────────────
  Future<PaginatedPartUsedList> getPartsUsed({int? serviceJob, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.partsUsed,
      queryParameters: {
        if (serviceJob != null) 'service_job': serviceJob,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedPartUsedList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<PartUsedModel> addPartUsed(PartUsedCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.partsUsed,
      data: request.toJson(),
    );
    return PartUsedModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deletePartUsed(int id) async {
    await dio.delete(ApiEndpoints.partsUsedById(id));
  }
}
