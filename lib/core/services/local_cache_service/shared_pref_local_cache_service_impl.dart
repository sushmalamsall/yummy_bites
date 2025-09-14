import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_cache_service_type.dart';

class SharedPreferencesLocalCacheService extends LocalCacheServiceType {
  final SharedPreferences preferences;

  SharedPreferencesLocalCacheService(this.preferences);

  @override
  Future<void> store<T>(String key, T value, {Function? toJson}) async {
    if (T == int || value is int) {
      await preferences.setInt(key, (value as int));
      return;
    } else if (T == double || value is double) {
      await preferences.setDouble(key, (value as double));
      return;
    } else if (T == String || value is String) {
      await preferences.setString(key, (value as String));
      return;
    } else if (T == bool || value is bool) {
      await preferences.setBool(key, (value as bool));
      return;
    } else {
      if (toJson != null) {
        await preferences.setString(key, jsonEncode(toJson(value)));
        return;
      } else {
        throw "LocalCacheObject, Cannot be cached";
      }
    }
  }

  @override
  Future<T?> retrieve<T>(String key, {Function? fromJson}) async {
    if (T == int) {
      return preferences.getInt(key) as T?;
    } else if (T == double) {
      return preferences.getDouble(key) as T?;
    } else if (T == String) {
      return preferences.getString(key) as T?;
    } else if (T == bool) {
      return preferences.getBool(key) as T?;
    } else {
      if (fromJson != null) {
        final data = preferences.getString(key);
        if (data == null) return null;
        return fromJson(jsonDecode(data));
      } else {
        throw "LocalCacheObject, Cannot be retrieved";
      }
    }
  }

  @override
  clear() => preferences.clear();

  @override
  remove(String key) => preferences.remove(key);
}
