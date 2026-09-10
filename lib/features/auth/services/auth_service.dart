import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/dio_client.dart';
import '../../admin/models/user_model.dart';
import '../models/auth_models.dart';

class AuthService {
  final Dio _dio;
  final SharedPreferences _storage;

  AuthService({
    required DioClient dioClient,
    required SharedPreferences storage,
  })  : _dio = dioClient.dio,
        _storage = storage;

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
          _unwrap(response.data) as Map<String, dynamic>,
        );
        await _storage.setString(_accessTokenKey, tokenResponse.access);
        await _storage.setString(_refreshTokenKey, tokenResponse.refresh);
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
      final token = _storage.getString(_accessTokenKey);
      if (token == null || token.isEmpty) return null;

      final response = await _dio.get(
        ApiEndpoints.me,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(
          _unwrap(response.data) as Map<String, dynamic>,
        );
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  // ── Token Helpers ────────────────────────────────────────────────────────

  static dynamic _unwrap(dynamic data) {
    if (data is Map<String, dynamic> &&
        data.containsKey('success') &&
        data.containsKey('data')) {
      return data['data'];
    }
    return data;
  }

  Future<bool> isLoggedIn() async {
    final token = _storage.getString(_accessTokenKey);
    return token != null && token.isNotEmpty;
  }

  Future<String?> getAccessToken() async {
    return _storage.getString(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return _storage.getString(_refreshTokenKey);
  }

  Future<void> saveTokens({required String access, required String refresh}) async {
    await _storage.setString(_accessTokenKey, access);
    await _storage.setString(_refreshTokenKey, refresh);
  }

  Future<void> saveAccessToken(String access) async {
    await _storage.setString(_accessTokenKey, access);
  }

  // ── Logout ───────────────────────────────────────────────────────────────

  Future<void> logout() async {
    final refreshToken = _storage.getString(_refreshTokenKey);

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

    await _storage.remove(_accessTokenKey);
    await _storage.remove(_refreshTokenKey);
  }
}
