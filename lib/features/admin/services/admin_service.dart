import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/user_model.dart';
import '../models/spare_part_model.dart';
import '../models/quality_check_model.dart';

class AdminService {
  final Dio dio;

  AdminService({required this.dio});

  // ── Users/Staff ────────────────────────────

  Future<PaginatedUserList> getUsers({String? search, int? page, int? pageSize}) async {
    try {
      final params = <String, dynamic>{};
      if (search != null && search.isNotEmpty) params['search'] = search;
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.users, queryParameters: params);

      if (response.statusCode == 200) {
        return PaginatedUserList.fromJson(_unwrap(response.data) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load users (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<UserModel> getUser(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.userById(id));

      if (response.statusCode == 200) {
        return UserModel.fromJson(_unwrap(response.data) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<UserModel> createUser(UserCreateRequest request) async {
    try {
      final data = request.toJson()..removeWhere((_, value) => value == null);
      final response = await dio.post(
        ApiEndpoints.users,
        data: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = _unwrap(response.data);
        if (body is Map<String, dynamic> && body.containsKey('id')) {
          return UserModel.fromJson(body);
        }
        return UserModel(
          id: 0,
          email: request.email,
          name: request.name,
          phone: request.phone,
          role: request.role,
          specialization: request.specialization,
        );
      } else {
        throw Exception('Failed to create user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<UserModel> updateUser(int id, Map<String, dynamic> data) async {
    try {
      final response = await dio.patch(ApiEndpoints.userById(id), data: data);

      if (response.statusCode == 200) {
        return UserModel.fromJson(_unwrap(response.data) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final response = await dio.delete(ApiEndpoints.userById(id));

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Failed to delete user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> activateUser(int id) async {
    try {
      final response = await dio.patch(ApiEndpoints.userActivate(id));

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to activate user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> deactivateUser(int id) async {
    try {
      final response = await dio.patch(ApiEndpoints.userDeactivate(id));

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to deactivate user (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Spare Parts ──────────────────────────────────────────────────────────

  Future<PaginatedSparePartList> getSpareParts({String? search, int? page, int? pageSize}) async {
    try {
      final params = <String, dynamic>{};
      if (search != null && search.isNotEmpty) params['search'] = search;
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.spareParts, queryParameters: params);

      if (response.statusCode == 200) {
        return PaginatedSparePartList.fromJson(_unwrap(response.data) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load spare parts (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<SparePartModel> getSparePart(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.sparePartById(id));

      if (response.statusCode == 200) {
        return SparePartModel.fromJson(_unwrap(response.data) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load spare part (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<SparePartModel> createSparePart(SparePartCreateRequest request) async {
    try {
      final response = await dio.post(ApiEndpoints.spareParts, data: request.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = _unwrap(response.data);
        if (body is Map<String, dynamic> && body.containsKey('id')) {
          return SparePartModel.fromJson(body);
        }
        return SparePartModel(
          id: 0,
          name: request.name,
          partNumber: request.partNumber,
        );
      } else {
        throw Exception('Failed to create spare part (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> addStock(int partId, String quantity) async {
    try {
      final response = await dio.post(
        ApiEndpoints.addStock(partId),
        data: {'quantity': quantity},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add stock (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> reduceStock(int partId, String quantity) async {
    try {
      final response = await dio.post(
        ApiEndpoints.reduceStock(partId),
        data: {
          'quantity': quantity,
          'reason': 'Manual stock reduction by admin',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to reduce stock (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<dynamic>> getStockHistory(int partId) async {
    try {
      final response = await dio.get(ApiEndpoints.stockHistory(partId));

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is List) return data;
        return [];
      } else {
        throw Exception('Failed to load stock history (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<dynamic>> getLowStockParts() async {
    try {
      final response = await dio.get(ApiEndpoints.lowStock);

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is List) return data;
        return [];
      } else {
        throw Exception('Failed to load low stock parts (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Quality Checks ──────────────────────────────────────────────────────

  Future<QualityCheckModel> createQualityCheck(QualityCheckCreateRequest request) async {
    try {
      final response = await dio.post(ApiEndpoints.qualityChecks, data: request.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = _unwrap(response.data);
        return QualityCheckModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create quality check (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Dashboard ────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> getDashboardSummary() async {
    try {
      final response = await dio.get(ApiEndpoints.dashboardSummary);

      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;
        final data = body['data'];
        if (data is Map<String, dynamic>) {
          return data;
        }
        return body;
      } else {
        throw Exception('Failed to load dashboard (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Reports ──────────────────────────────────────────────────────────────

  Map<String, String> _currentMonthRange() {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final from = '${now.year}-$month-01';
    final to =
        '${now.year}-$month-${now.day.toString().padLeft(2, '0')}';
    return {'from': from, 'to': to};
  }

  Future<dynamic> getMonthlyRevenue() async {
    try {
      final now = DateTime.now();
      final params = {'month': '${now.month}', 'year': '${now.year}'};
      final response = await dio.get(
        ApiEndpoints.monthlyRevenue,
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return _unwrap(response.data);
      } else {
        throw Exception('Failed to load monthly revenue (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<dynamic> getCompletedServices() async {
    try {
      final params = _currentMonthRange();
      final response = await dio.get(
        ApiEndpoints.completedServices,
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return _unwrap(response.data);
      } else {
        throw Exception('Failed to load completed services (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<dynamic> getMechanicProductivity() async {
    try {
      final params = _currentMonthRange();
      final response = await dio.get(
        ApiEndpoints.mechanicProductivity,
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return _unwrap(response.data);
      } else {
        throw Exception('Failed to load mechanic productivity (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<dynamic> getSparePartsUsage() async {
    try {
      final params = _currentMonthRange();
      final response = await dio.get(
        ApiEndpoints.sparePartsUsage,
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return _unwrap(response.data);
      } else {
        throw Exception('Failed to load spare parts usage (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<Map<String, dynamic>> getPendingPayments() async {
    try {
      final response = await dio.get(ApiEndpoints.pendingPaymentsSummary);

      if (response.statusCode == 200) {
        final body = _unwrap(response.data);
        if (body is Map<String, dynamic>) {
          return body;
        }
      }
      throw Exception('Failed to load pending payments (status: ${response.statusCode})');
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<dynamic> getDailyRevenue() async {
    try {
      final response = await dio.get(ApiEndpoints.dailyRevenue);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load daily revenue (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Helper ───────────────────────────────────────────────────────────────

  /// The backend wraps most payloads in {"success":..,"message":..,"data":..}.
  /// This extracts the actual data, leaving already-unwrapped payloads as is.
  static dynamic _unwrap(dynamic data) {
    if (data is Map<String, dynamic> &&
        data.containsKey('success') &&
        data.containsKey('data')) {
      return data['data'];
    }
    return data;
  }

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
