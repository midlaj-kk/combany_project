import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefernceStorage {
  SharedPrefernceStorage._internal();
  static final SharedPrefernceStorage instance = SharedPrefernceStorage._internal();
  factory SharedPrefernceStorage() => instance;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userRoleKey = 'user_role';

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userRoleKey);
  }
}