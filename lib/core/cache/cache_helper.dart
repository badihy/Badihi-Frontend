import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/presentation/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences _preferences;

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  Future<void> clearUserData() async {
    await _preferences.remove(ApiKey.token);
    await _preferences.remove(ApiKey.refreshToken);
    await _preferences.remove(ApiKey.id);
    await _preferences.remove(ApiKey.fullName);
    await _preferences.remove(ApiKey.username);
    await _preferences.remove(ApiKey.email);
  }

  Future<void> saveUserSession(LoginModel currentUser) async {
    final user = currentUser.data.user;

    await getIt<CacheHelper>().setString(ApiKey.token, currentUser.data.token);
    await getIt<CacheHelper>().setString(ApiKey.refreshToken, currentUser.data.refreshToken);
    await getIt<CacheHelper>().setString(ApiKey.id, user.id);
    await getIt<CacheHelper>().setString(ApiKey.fullName, user.fullName);
    await getIt<CacheHelper>().setString(ApiKey.username, user.username);
    await getIt<CacheHelper>().setString(ApiKey.email, user.email);
    await getIt<CacheHelper>().setString(ApiKey.profileImage, user.profileImage ?? '');
  }
}
