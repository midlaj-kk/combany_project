import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../admin/data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokenResponse = await remoteDataSource.login(
        email: email,
        password: password,
      );

      await localDataSource.saveTokens(
        access: tokenResponse.access,
        refresh: tokenResponse.refresh,
      );

      final user = await remoteDataSource.getCurrentUser();

      await localDataSource.saveUserId(user.id);
      await localDataSource.saveUserRole(user.role.name);
      await localDataSource.saveUserName(user.name);
      await localDataSource.saveUserEmail(user.email);

      return Success(user);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      return FailureResult(message);
    } on Exception catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      final refreshToken = await localDataSource.getRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          await remoteDataSource.logout(refreshToken: refreshToken);
        } on DioException {
          // Logout endpoint may fail if token is already invalid;
          // proceed with local cleanup regardless.
        }
      }
      await localDataSource.clearTokens();
      return const Success(null);
    } on Exception catch (e) {
      await localDataSource.clearTokens();
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<UserModel>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();

      await localDataSource.saveUserId(user.id);
      await localDataSource.saveUserRole(user.role.name);
      await localDataSource.saveUserName(user.name);
      await localDataSource.saveUserEmail(user.email);

      return Success(user);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      if (e.response?.statusCode == 401) {
        await localDataSource.clearTokens();
      }
      return FailureResult(message);
    } on Exception catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<bool> isLoggedIn() => localDataSource.isLoggedIn();

  @override
  Future<String?> getUserRole() => localDataSource.getUserRole();

  @override
  Future<int?> getUserId() => localDataSource.getUserId();

  String _extractErrorMessage(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data as Map<String, dynamic>;
      if (data.containsKey('detail')) {
        return data['detail'].toString();
      }
      final errors = <String>[];
      data.forEach((key, value) {
        if (value is List) {
          errors.add('$key: ${value.join(', ')}');
        } else {
          errors.add('$key: $value');
        }
      });
      if (errors.isNotEmpty) return errors.join('\n');
    }
    return e.message ?? 'An unexpected error occurred.';
  }
}
