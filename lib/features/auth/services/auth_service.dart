import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/dio_client.dart';
import '../../admin/models/user_model.dart';
import '../models/auth_models.dart';

class AuthService {
  final Dio _dio;
  final SharedPreferences _prefs;

  AuthService({required DioClient dioClient, required SharedPreferences prefs})
      : _dio = dioClient.dio,
        _prefs = prefs;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      final tokenResponse = TokenResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      await _prefs.setString(_accessTokenKey, tokenResponse.access);
      await _prefs.setString(_refreshTokenKey, tokenResponse.refresh);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final token = _prefs.getString(_accessTokenKey);
      if (token == null || token.isEmpty) return null;

      final response = await _dio.get(
        ApiEndpoints.me,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = _prefs.getString(_accessTokenKey);
    return token != null && token.isNotEmpty;
  }

  String? getAccessToken() {
    return _prefs.getString(_accessTokenKey);
  }

  String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _prefs.setString(_accessTokenKey, access);
    await _prefs.setString(_refreshTokenKey, refresh);
  }

  Future<void> logout() async {
    final refreshToken = _prefs.getString(_refreshTokenKey);
    if (refreshToken != null && refreshToken.isNotEmpty) {
      try {
        await _dio.post(
          ApiEndpoints.logout,
          data: {'refresh': refreshToken},
        );
      } catch (_) {}
    }
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }
}
