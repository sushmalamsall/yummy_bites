import 'app_update_service.app.dart'
    if (dart.library.js) 'app_update_service.web.dart'
    as update_service;

abstract class AppUpdateService {
  Future<void> update();
}

final appUpdateService = AppUpdateServiceImpl();

class AppUpdateServiceImpl extends AppUpdateService {
  @override
  Future<void> update() async {
    return await update_service.updateApp();
  }
}
