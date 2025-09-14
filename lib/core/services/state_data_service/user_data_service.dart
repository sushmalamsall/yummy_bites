import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import '../../logger/logger_service.dart';
import '../local_cache_service/local_cache_service.dart';

class UserDataService {
  Log log = Log(UserDataService);

  UserDataService._();

  factory UserDataService() {
    return _instance;
  }

  static final _instance = UserDataService._();

  LocalCacheUserModel? _cacheUserModel;

  String? get accessToken => _cacheUserModel?.token;

  bool get isLoggedIn => accessToken != null;

  String? get userId => _cacheUserModel?.userId;

  String? get pr => null;

  Future save({required String userId, required String token}) async {
    _cacheUserModel = LocalCacheUserModel(userId: userId, token: token);
    await LocalCacheService.storeAuth(_cacheUserModel!);
  }

  retrieve() async {
    _cacheUserModel = await LocalCacheService.retrieveAuth();
  }

  Future _clear() async {
    _cacheUserModel = null;
    // profile = null;
    await LocalCacheService.clearAuth();

    log.s("User Detail Cleared from Cache");
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut().then((_) {
      log.s("User cleared");
    });
  }

  Future logout() async {
    try {
      await Future.wait(<Future>[_clear(), signOut()]);
      // RouterHelper().navigateToLoginView();
    } catch (e) {
      log.e(e);
    }
  }

  // UserModel? profile;
  // void setMyProfile(UserModel? data) {
  //   profile = data;
  // }
}
