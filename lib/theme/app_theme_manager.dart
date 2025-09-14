import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:yummy_bites/theme/app_colors.dart';
import 'package:yummy_bites/theme/app_theme.dart';
import 'package:yummy_bites/theme/app_theme_service.dart';

class AppThemeManager {
  AppThemeModel get initialTheme => theme;

  static Future initialise() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  final AppThemeModel theme;
  late BehaviorSubject<AppThemeModel> _themesController;

  Stream<AppThemeModel> get themesStream => _themesController.stream;

  AppThemeManager({required this.theme}) {
    _themesController = BehaviorSubject<AppThemeModel>.seeded(theme);
    AppThemeService.getInstance().setThemeManager(this);
  }
}

AppThemeManager getThemeManager(BuildContext context) =>
    Provider.of<AppThemeManager>(context, listen: false);

class AppThemeModel {
  final ThemeData theme;
  final AppColors colorsModel;

  AppThemeModel({required this.theme, required this.colorsModel});

  static AppThemeModel data() => AppThemeModel(
    theme: AppTheme.getTheme(AppColors.data()),
    colorsModel: AppColors.data(),
  );
}
