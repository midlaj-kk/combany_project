import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/service_work_model.dart';
import '../models/part_used_model.dart';

class MechanicService {
  final Dio dio;

  MechanicService({required this.dio});

  // ── Service Works ────────────────────────────────────────────────────────

  Future<PaginatedServiceWorkList> getWorks({int? serviceJob, int? page, int? pageSize}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.works,
        queryParameters: {
          if (serviceJob != null) 'service_job': serviceJob,
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        return PaginatedServiceWorkList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load works (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceWorkModel> createWork(ServiceWorkCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.works,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ServiceWorkModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create work (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<ServiceWorkModel> updateWorkStatus(int workId, String status) async {
    try {
      final response = await dio.post(
        ApiEndpoints.workStatus(workId),
        data: {'status': status},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ServiceWorkModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update work status (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Parts Used ───────────────────────────────────────────────────────────

  Future<PaginatedPartUsedList> getPartsUsed({int? serviceJob, int? page, int? pageSize}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.partsUsed,
        queryParameters: {
          if (serviceJob != null) 'service_job': serviceJob,
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        return PaginatedPartUsedList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load parts used (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<PartUsedModel> addPartUsed(PartUsedCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.partsUsed,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return PartUsedModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to add part used (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> deletePartUsed(int id) async {
    try {
      final response = await dio.delete(ApiEndpoints.partsUsedById(id));

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Failed to delete part used (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Helper ───────────────────────────────────────────────────────────────

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
