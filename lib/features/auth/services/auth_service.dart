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

  // ── Login ────────────────────────────────────────────────────────────────

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final tokenResponse = TokenResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        await _prefs.setString(_accessTokenKey, tokenResponse.access);
        await _prefs.setString(_refreshTokenKey, tokenResponse.refresh);
        return true;
      } else {
        return false;
      }
    } on DioException {
      return false;
    }
  }

  // ── Get Current User ────────────────────────────────────────────────────

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

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  // ── Token Helpers ────────────────────────────────────────────────────────

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

  Future<void> saveTokens({required String access, required String refresh}) async {
    await _prefs.setString(_accessTokenKey, access);
    await _prefs.setString(_refreshTokenKey, refresh);
  }

  // ── Logout ───────────────────────────────────────────────────────────────

  Future<void> logout() async {
    final refreshToken = _prefs.getString(_refreshTokenKey);

    if (refreshToken != null && refreshToken.isNotEmpty) {
      try {
        final response = await _dio.post(
          ApiEndpoints.logout,
          data: {'refresh': refreshToken},
        );

        if (response.statusCode != 200 && response.statusCode != 204) {
          // Logout failed on server, but we still clear local tokens
        }
      } on DioException {
        // Ignore server errors during logout
      }
    }

    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }
}
