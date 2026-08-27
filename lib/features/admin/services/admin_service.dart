import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/user_model.dart';
import '../models/spare_part_model.dart';
import '../models/quality_check_model.dart';

class AdminService {
  final Dio dio;
  AdminService({required this.dio});

  // Users/Staff
  Future<PaginatedUserList> getUsers({String? search, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.users,
      queryParameters: {
        if (search != null && search.isNotEmpty) 'search': search,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedUserList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> getUser(int id) async {
    final response = await dio.get('${ApiEndpoints.users}/$id/');
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> createUser(UserCreateRequest request) async {
    final data = request.toJson()..removeWhere((_, value) => value == null);
    final response = await dio.post(
      ApiEndpoints.users,
      data: data,
    );
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> updateUser(int id, Map<String, dynamic> data) async {
    final response = await dio.patch('${ApiEndpoints.users}/$id/', data: data);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteUser(int id) async {
    await dio.delete('${ApiEndpoints.users}/$id/');
  }

  Future<void> activateUser(int id) async {
    await dio.patch('${ApiEndpoints.users}/$id/activate/');
  }

  Future<void> deactivateUser(int id) async {
    await dio.patch('${ApiEndpoints.users}/$id/deactivate/');
  }

  // Spare Parts
  Future<PaginatedSparePartList> getSpareParts({String? search, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.spareParts,
      queryParameters: {
        if (search != null && search.isNotEmpty) 'search': search,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedSparePartList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SparePartModel> getSparePart(int id) async {
    final response = await dio.get('${ApiEndpoints.spareParts}/$id/');
    return SparePartModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SparePartModel> createSparePart(SparePartCreateRequest request) async {
    final response = await dio.post(ApiEndpoints.spareParts, data: request.toJson());
    return SparePartModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> addStock(int partId, String quantity) async {
    await dio.post('${ApiEndpoints.spareParts}/$partId/add_stock/', data: {'quantity': quantity});
  }

  Future<void> reduceStock(int partId, String quantity) async {
    await dio.post('${ApiEndpoints.spareParts}/$partId/reduce_stock/', data: {'quantity': quantity});
  }

  Future<List<dynamic>> getStockHistory(int partId) async {
    final response = await dio.get('${ApiEndpoints.spareParts}/$partId/stock_history/');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getLowStockParts() async {
    final response = await dio.get('${ApiEndpoints.spareParts}low_stock/');
    return response.data as List<dynamic>;
  }

  // Quality Checks
  Future<QualityCheckModel> createQualityCheck(QualityCheckCreateRequest request) async {
    final response = await dio.post(ApiEndpoints.qualityChecks, data: request.toJson());
    return QualityCheckModel.fromJson(response.data as Map<String, dynamic>);
  }

  // Dashboard
  Future<Map<String, dynamic>> getDashboardSummary() async {
    final response = await dio.get(ApiEndpoints.dashboardSummary);
    return response.data as Map<String, dynamic>;
  }

  // Reports
  Future<dynamic> getMonthlyRevenue() async {
    final response = await dio.get(ApiEndpoints.monthlyRevenue);
    return response.data;
  }

  Future<dynamic> getCompletedServices() async {
    final response = await dio.get(ApiEndpoints.completedServices);
    return response.data;
  }

  Future<dynamic> getMechanicProductivity() async {
    final response = await dio.get(ApiEndpoints.mechanicProductivity);
    return response.data;
  }

  Future<dynamic> getSparePartsUsage() async {
    final response = await dio.get(ApiEndpoints.sparePartsUsage);
    return response.data;
  }

  Future<dynamic> getDailyRevenue() async {
    final response = await dio.get(ApiEndpoints.dailyRevenue);
    return response.data;
  }
}
