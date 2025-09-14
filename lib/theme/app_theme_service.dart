import 'package:yummy_bites/theme/app_theme_manager.dart';

class AppThemeService {
  static AppThemeService? _instance;

  static AppThemeService getInstance() {
    _instance ??= AppThemeService();

    return _instance!;
  }

  late AppThemeManager _themeManager;

  void setThemeManager(AppThemeManager manager) => _themeManager = manager;
}
