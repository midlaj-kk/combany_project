import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../admin/data/models/user_model.dart';
import '../models/auth_models.dart';

abstract class AuthRemoteDataSource {
  Future<TokenResponse> login({
    required String email,
    required String password,
  });
  Future<void> logout({required String refreshToken});
  Future<TokenResponse> refreshToken({required String refreshToken});
  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl({required DioClient dioClient})
      : _dio = dioClient.dio;

  @override
  Future<TokenResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return TokenResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout({required String refreshToken}) async {
    await _dio.post(
      ApiEndpoints.logout,
      data: {'refresh': refreshToken},
    );
  }

  @override
  Future<TokenResponse> refreshToken({required String refreshToken}) async {
    final response = await _dio.post(
      ApiEndpoints.refreshToken,
      data: {'refresh': refreshToken},
    );
    return TokenResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _dio.get(ApiEndpoints.me);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
