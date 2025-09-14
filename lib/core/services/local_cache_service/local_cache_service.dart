import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy_bites/core/logger/logger_service.dart';
import 'local_cache_service_type.dart';
import 'shared_pref_local_cache_service_impl.dart';

class LocalCacheUserModel {
  String? userId;
  String? token;

  LocalCacheUserModel({this.userId, this.token});

  LocalCacheUserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['token'] = token;
    return data;
  }
}

/// This is third party module to cache variables using shared preferences [ LocalCacheService ]
/// PRIMITIVE types [ int, double, String, bool ] can be stored and retrieved through shared preferences directly.
/// For other than that types, function must be passed
/// To store, it must be encoded into json and saved as string
/// To retrieve, it must be decoded from json
class LocalCacheService {
  static final Log _log = Log(LocalCacheService);

  static late LocalCacheServiceType _cacheService;

  static Future<void> initialize() async {
    _cacheService = SharedPreferencesLocalCacheService(
      await SharedPreferences.getInstance(),
    );
  }

  static const String _authKey = "auth";

  static Future<void> storeAuth(LocalCacheUserModel auth) async {
    try {
      _log.d(auth.toJson(), tag: "storeAuth");
      await _cacheService.store<String>(_authKey, jsonEncode(auth.toJson()));
    } catch (e) {
      _log.e(e, tag: "storeAuth");
    }
  }

  static Future<LocalCacheUserModel?> retrieveAuth() async {
    try {
      final data = await _cacheService.retrieve<String>(_authKey);
      _log.d(data, tag: "retrieveAuth");

      if (data == null) return null;
      return LocalCacheUserModel.fromJson(jsonDecode(data));
    } catch (e) {
      _log.e(e, tag: "retrieveAuth");
    }

    return null;
  }

  static clearAuth() {
    return _cacheService.remove(_authKey);
  }

  static const String _loginKey = "loginKey";
  static Future<void> storeLoginInfo(LoginInfoModel loginInfo) async {
    try {
      _log.d(loginInfo.toJson(), tag: "storeLoginInfo");
      await _cacheService.store<String>(
        _loginKey,
        jsonEncode(loginInfo.toJson()),
      );
    } catch (e) {
      _log.e(e, tag: "storeLoginInfo");
    }
  }

  static Future<LoginInfoModel?> retrieveLoginInfo() async {
    try {
      final data = await _cacheService.retrieve<String>(_loginKey);
      _log.d(data, tag: "retrieveLoginInfo");

      if (data == null) return null;
      return LoginInfoModel.fromJson(jsonDecode(data));
    } catch (e) {
      _log.e(e, tag: "retrieveLoginInfo");
    }
    return null;
  }

  static clearLoginInfo() {
    return _cacheService.remove(_loginKey);
  }

  static const String _notificationKey = "notificationStatus";
  static const String _biometricKey = "biometricStatus";

  static Future<void> storeNotificationStatus(bool status) async {
    try {
      _log.d(status, tag: "storeNotificationStatus");
      await _cacheService.store<bool>(_notificationKey, status);
    } catch (e) {
      _log.e(e, tag: "storeNotificationStatus");
    }
  }

  static Future<void> storeBiometricStatus(bool status) async {
    try {
      _log.d(status, tag: "storeBiometricStatus");
      await _cacheService.store<bool>(_biometricKey, status);
    } catch (e) {
      _log.e(e, tag: "storeBiometricStatus");
    }
  }

  static Future<bool?> retrieveNotificationStatus() async {
    try {
      final status = await _cacheService.retrieve<bool>(_notificationKey);
      _log.d(status, tag: "retrieveNotificationStatus");
      return status;
    } catch (e) {
      _log.e(e, tag: "retrieveNotificationStatus");
    }
    return null;
  }

  static Future<bool?> retrieveBiometricStatus() async {
    try {
      final status = await _cacheService.retrieve<bool>(_biometricKey);
      _log.d(status, tag: "retrieveBiometricStatus");
      return status;
    } catch (e) {
      _log.e(e, tag: "retrieveBiometricStatus");
    }
    return null;
  }

  static Future<void> clearNotificationStatus() async {
    return _cacheService.remove(_notificationKey);
  }

  static Future<void> clearBiometricStatus() async {
    return _cacheService.remove(_biometricKey);
  }

  static const String _notificationTopicsKey = "notification Topics";

  static Future<void> storeNotificationTopics(List<String> topics) async {
    try {
      _log.d(topics.join(","), tag: "storeNotificationTopics");
      await _cacheService.store<String>(
        _notificationTopicsKey,
        topics.join(","),
      );
    } catch (e) {
      _log.e(e, tag: "storeNotificationTopics");
    }
  }

  static Future<List<String>?> retrieveNotificationTopics() async {
    try {
      final data = await _cacheService.retrieve<String>(_notificationTopicsKey);
      _log.d(data?.split(",").toList(), tag: "retrieveNotificationTopics");

      if (data == null) return null;

      return data.split(",").toList();
    } catch (e) {
      _log.e(e, tag: "retrieveNotificationTopics");
    }

    return null;
  }

  static clearNotificationTopics() {
    return _cacheService.remove(_notificationTopicsKey);
  }

  static Future<void> store<T>(String key, T value, {Function? toJson}) =>
      _cacheService.store<T>(key, value, toJson: toJson);

  static Future<T?> retrieve<T>(String key, {Function? fromJson}) =>
      _cacheService.retrieve<T>(key, fromJson: fromJson);

  static clear() => _cacheService.clear();

  static remove(String key) => _cacheService.remove(key);
}

class LoginInfoModel {
  String? loginId;
  String? password;
  bool? rememberMe;

  LoginInfoModel({this.loginId, this.password, this.rememberMe});

  LoginInfoModel.fromJson(Map<String, dynamic> json) {
    loginId = json['loginId'];
    password = json['password'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['loginId'] = loginId;
    data['password'] = password;
    data['rememberMe'] = rememberMe;
    return data;
  }
}
