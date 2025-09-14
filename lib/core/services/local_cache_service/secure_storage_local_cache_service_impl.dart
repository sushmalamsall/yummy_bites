import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_cache_service_type.dart';

class SecuredStorageLocalCacheService extends LocalCacheServiceType {
  final FlutterSecureStorage preferences;

  SecuredStorageLocalCacheService(this.preferences);

  @override
  Future<void> store<T>(String key, T value, {Function? toJson}) async {
    if (T == int || value is int) {
      return preferences.write(key: key, value: (value as int).toString());
    } else if (T == double || value is double) {
      return preferences.write(key: key, value: (value as double).toString());
    } else if (T == String || value is String) {
      return preferences.write(key: key, value: (value as String));
    } else if (T == bool || value is bool) {
      return preferences.write(key: key, value: (value as bool).toString());
    } else {
      if (toJson != null) {
        return preferences.write(key: key, value: jsonEncode(toJson(value)));
      } else {
        throw "LocalCacheObject, Cannot be cached";
      }
    }
  }

  @override
  Future<T?> retrieve<T>(String key, {Function? fromJson}) async {
    if (T == int) {
      final value = await preferences.read(key: key);
      return (int.tryParse(value ?? "") ?? 0) as T?;
    } else if (T == double) {
      final value = await preferences.read(key: key);
      return (double.tryParse(value ?? "") ?? 0) as T?;
    } else if (T == String) {
      final value = await preferences.read(key: key);
      return value as T?;
    } else if (T == bool) {
      final value = await preferences.read(key: key);
      if (value == "true") {
        return true as T?;
      } else if (value == "false") {
        return false as T?;
      }
    } else {
      if (fromJson != null) {
        final data = await preferences.read(key: key);
        if (data == null) return null;
        return fromJson(jsonDecode(data));
      } else {
        throw "LocalCacheObject, Cannot be retrieved";
      }
    }

    return null;
  }

  @override
  clear() => preferences.deleteAll();

  @override
  remove(String key) => preferences.delete(key: key);
}
