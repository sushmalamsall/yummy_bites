import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yummy_bites/core/dependency_injection/injection.dart';
import 'package:yummy_bites/core/services/local_cache_service/local_cache_service.dart';
import 'package:yummy_bites/routes/app_routes.dart';
import 'package:yummy_bites/theme/app_theme_builder.dart';
import 'package:yummy_bites/theme/app_theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalCacheService.initialize();
  await configureDependencies();
  await LocalCacheService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      theme: AppThemeModel.data(),
      builder: (BuildContext context, AppThemeModel themeModel) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Yummy Bites",
          theme: themeModel.theme,
          routerConfig: injection<AppRouter>().config(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
        );
      },
    );
  }
}
