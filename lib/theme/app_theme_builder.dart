import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/theme/app_theme_manager.dart';

class AppThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext, AppThemeModel) builder;
  final AppThemeModel theme;

  const AppThemeBuilder({
    super.key,
    required this.theme,
    required this.builder,
  });

  @override
  createState() => _AppThemeBuilderState(AppThemeManager(theme: theme));
}

class _AppThemeBuilderState extends State<AppThemeBuilder>
    with WidgetsBindingObserver {
  final AppThemeManager themeManager;

  _AppThemeBuilderState(this.themeManager);

  @override
  Widget build(BuildContext context) {
    return Provider<AppThemeManager>.value(
      value: themeManager,
      builder: (context, child) => StreamProvider<AppThemeModel>(
        lazy: false,
        initialData: themeManager.initialTheme,
        create: (context) => themeManager.themesStream,
        builder: (context, child) => Consumer<AppThemeModel>(
          child: child,
          builder: (context, themeModel, child) =>
              widget.builder(context, themeModel),
        ),
      ),
    );
  }
}
