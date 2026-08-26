import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_service.dart';
import '../models/user_model.dart';
import '../models/spare_part_model.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminService service;
  AdminRepositoryImpl({required this.service});

  @override
  Future<Result<PaginatedUserList>> getUsers({String? search, int? page}) async {
    try {
      final result = await service.getUsers(search: search, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load users');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<UserModel>> createUser(UserCreateRequest request) async {
    try {
      final result = await service.createUser(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create user');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> deleteUser(int id) async {
    try {
      await service.deleteUser(id);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to delete user');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> activateUser(int id) async {
    try {
      await service.activateUser(id);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to activate user');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> deactivateUser(int id) async {
    try {
      await service.deactivateUser(id);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to deactivate user');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<PaginatedSparePartList>> getSpareParts({String? search, int? page}) async {
    try {
      final result = await service.getSpareParts(search: search, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load spare parts');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<SparePartModel>> getSparePart(int id) async {
    try {
      final result = await service.getSparePart(id);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load spare part');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> addStock(int partId, String quantity) async {
    try {
      await service.addStock(partId, quantity);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to add stock');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> reduceStock(int partId, String quantity) async {
    try {
      await service.reduceStock(partId, quantity);
      return const Success(null);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to reduce stock');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<dynamic>>> getStockHistory(int partId) async {
    try {
      final result = await service.getStockHistory(partId);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load stock history');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getDashboardSummary() async {
    try {
      final result = await service.getDashboardSummary();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load dashboard');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getMonthlyRevenue() async {
    try {
      final result = await service.getMonthlyRevenue();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load monthly revenue');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getCompletedServices() async {
    try {
      final result = await service.getCompletedServices();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load completed services');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getMechanicProductivity() async {
    try {
      final result = await service.getMechanicProductivity();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load mechanic productivity');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getSparePartsUsage() async {
    try {
      final result = await service.getSparePartsUsage();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load spare parts usage');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getDailyRevenue() async {
    try {
      final result = await service.getDailyRevenue();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load daily revenue');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}
