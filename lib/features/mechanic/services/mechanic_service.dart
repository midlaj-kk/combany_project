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
      final params = <String, dynamic>{};
      if (serviceJob != null) params['service_job'] = serviceJob;
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.works, queryParameters: params);

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

  Future<void> updateWorkStatus(int workId, String status) async {
    try {
      final response = await dio.patch(
        ApiEndpoints.workStatus(workId),
        data: {'status': status},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to update work status (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Parts Used ───────────────────────────────────────────────────────────

  Future<PaginatedPartUsedList> getPartsUsed({int? serviceJob, int? page, int? pageSize}) async {
    try {
      final params = <String, dynamic>{};
      if (serviceJob != null) params['service_job'] = serviceJob;
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.partsUsed, queryParameters: params);

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
        final data = response.data is Map
            ? response.data['data']
            : response.data;
        return PartUsedModel.fromJson(data as Map<String, dynamic>);
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

      switch (statusCode) {
        case 400:
          return 'Bad request. Please check your input.';
        case 401:
          return 'Unauthorized. Please login again.';
        case 403:
          return 'Access denied. You do not have permission.';
        case 404:
          return 'Resource not found.';
        case 409:
          return 'Conflict. The resource already exists.';
        case 422:
          return 'Validation error. Please check your input.';
        case 429:
          return 'Too many requests. Please try again later.';
        case 500:
          return 'Internal server error. Please try again later.';
        case 502:
          return 'Bad gateway. Please try again later.';
        case 503:
          return 'Service unavailable. Please try again later.';
        case 504:
          return 'Gateway timeout. Please try again later.';
        default:
          return 'Server error ($statusCode). Please try again.';
      }
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
