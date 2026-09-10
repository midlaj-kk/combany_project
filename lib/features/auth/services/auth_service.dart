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
  static const _userRoleKey = 'user_role';
  static const _isLoggedInKey = 'is_logged_in';

  // ── Login ────────────────────────────────────────────────────────────────
  //
  // Logging in is atomic: if we get tokens from the server we also confirm
  // the current user (so the session is valid) and only then persist the
  // role + logged-in flag. A partial login (tokens without a confirmable
  // user) is discarded so a broken session can never survive a restart.

  Future<UserModel?> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode != 200) return null;

      final tokenResponse = TokenResponse.fromJson(
        _unwrap(response.data) as Map<String, dynamic>,
      );
      await _storage.setString(_accessTokenKey, tokenResponse.access);
      await _storage.setString(_refreshTokenKey, tokenResponse.refresh);

      final user = await getCurrentUser();
      if (user == null) {
        await clearLocalSession();
        return null;
      }

      await _persistSessionUser(user);
      return user;
    } catch (_) {
      await clearLocalSession();
      return null;
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
        final user = UserModel.fromJson(
          _unwrap(response.data) as Map<String, dynamic>,
        );
        await _persistSessionUser(user);
        return user;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  // ── Session Persistence ──────────────────────────────────────────────────

  /// Stores the role + logged-in flag alongside the tokens already saved.
  Future<void> _persistSessionUser(UserModel user) async {
    await _storage.setString(_userRoleKey, _userRoleToStored(user.role));
    await _storage.setBool(_isLoggedInKey, true);
  }

  static String _userRoleToStored(UserRole role) {
    return switch (role) {
      UserRole.serviceAdvisor => 'service_advisor',
      _ => role.name,
    };
  }

  /// Removes every session key so a stale login can never survive a restart.
  Future<void> clearLocalSession() async {
    await _storage.remove(_accessTokenKey);
    await _storage.remove(_refreshTokenKey);
    await _storage.remove(_userRoleKey);
    await _storage.remove(_isLoggedInKey);
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
    final loggedIn = _storage.getBool(_isLoggedInKey) ?? false;
    final token = _storage.getString(_accessTokenKey);
    return loggedIn && token != null && token.isNotEmpty;
  }

  Future<String?> getAccessToken() async {
    return _storage.getString(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return _storage.getString(_refreshTokenKey);
  }

  Future<String?> getUserRole() async {
    return _storage.getString(_userRoleKey);
  }

  Future<void> saveTokens({required String access, required String refresh}) async {
    await _storage.setString(_accessTokenKey, access);
    await _storage.setString(_refreshTokenKey, refresh);
    await _storage.setBool(_isLoggedInKey, true);
  }

  Future<void> saveAccessToken(String access) async {
    await _storage.setString(_accessTokenKey, access);
    await _storage.setBool(_isLoggedInKey, true);
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

    await _storage.setBool(_isLoggedInKey, false);
    await clearLocalSession();
  }
}
