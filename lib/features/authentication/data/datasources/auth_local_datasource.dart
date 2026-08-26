import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';

abstract class AuthLocalDataSource {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokens({required String access, required String refresh});
  Future<void> clearTokens();
  Future<String?> getUserRole();
  Future<void> saveUserRole(String role);
  Future<int?> getUserId();
  Future<void> saveUserId(int id);
  Future<String?> getUserName();
  Future<void> saveUserName(String name);
  Future<String?> getUserEmail();
  Future<void> saveUserEmail(String email);
  Future<bool> isLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String?> getAccessToken() async =>
      sharedPreferences.getString(AppConstants.accessTokenKey);

  @override
  Future<String?> getRefreshToken() async =>
      sharedPreferences.getString(AppConstants.refreshTokenKey);

  @override
  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await sharedPreferences.setString(AppConstants.accessTokenKey, access);
    await sharedPreferences.setString(AppConstants.refreshTokenKey, refresh);
  }

  @override
  Future<void> clearTokens() async {
    await sharedPreferences.remove(AppConstants.accessTokenKey);
    await sharedPreferences.remove(AppConstants.refreshTokenKey);
    await sharedPreferences.remove(AppConstants.userRoleKey);
    await sharedPreferences.remove(AppConstants.userIdKey);
    await sharedPreferences.remove(AppConstants.userNameKey);
    await sharedPreferences.remove(AppConstants.userEmailKey);
  }

  @override
  Future<String?> getUserRole() async =>
      sharedPreferences.getString(AppConstants.userRoleKey);

  @override
  Future<void> saveUserRole(String role) async =>
      sharedPreferences.setString(AppConstants.userRoleKey, role);

  @override
  Future<int?> getUserId() async =>
      sharedPreferences.getInt(AppConstants.userIdKey);

  @override
  Future<void> saveUserId(int id) async =>
      sharedPreferences.setInt(AppConstants.userIdKey, id);

  @override
  Future<String?> getUserName() async =>
      sharedPreferences.getString(AppConstants.userNameKey);

  @override
  Future<void> saveUserName(String name) async =>
      sharedPreferences.setString(AppConstants.userNameKey, name);

  @override
  Future<String?> getUserEmail() async =>
      sharedPreferences.getString(AppConstants.userEmailKey);

  @override
  Future<void> saveUserEmail(String email) async =>
      sharedPreferences.setString(AppConstants.userEmailKey, email);

  @override
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
