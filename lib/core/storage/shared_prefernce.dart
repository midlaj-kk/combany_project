import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around shared_preferences so the rest of the app
/// never touches the storage package directly.
///
/// NOTE: shared_preferences stores data in plain text on device,
/// unlike flutter_secure_storage. This is fine for development.
/// Before shipping to production, consider re-introducing
/// flutter_secure_storage (or an equivalent) once its native
/// build issue is resolved on your machine.
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