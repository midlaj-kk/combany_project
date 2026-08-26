import '../../../../core/error/result.dart';
import '../../data/models/user_model.dart';
import '../../data/models/spare_part_model.dart';

abstract class AdminRepository {
  Future<Result<PaginatedUserList>> getUsers({String? search, int? page});
  Future<Result<UserModel>> createUser(UserCreateRequest request);
  Future<Result<void>> deleteUser(int id);
  Future<Result<void>> activateUser(int id);
  Future<Result<void>> deactivateUser(int id);
  Future<Result<PaginatedSparePartList>> getSpareParts({String? search, int? page});
  Future<Result<SparePartModel>> getSparePart(int id);
  Future<Result<void>> addStock(int partId, String quantity);
  Future<Result<void>> reduceStock(int partId, String quantity);
  Future<Result<List<dynamic>>> getStockHistory(int partId);
  Future<Result<Map<String, dynamic>>> getDashboardSummary();
  Future<Result<dynamic>> getMonthlyRevenue();
  Future<Result<dynamic>> getCompletedServices();
  Future<Result<dynamic>> getMechanicProductivity();
  Future<Result<dynamic>> getSparePartsUsage();
  Future<Result<dynamic>> getDailyRevenue();
}
