import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy_bites/theme/app_theme_manager.dart';

class AppColors {
  final Color primaryBlack;
  final Color secondaryBlack;
  final Color mediumBlack;
  final Color lightBlack;
  final Color primaryYellow;
  final Color textYellow;
  final Color blue;
  final Color green;
  final Color white;
  final Color secondaryBackground;
  final Color yellow;
  final Color secondaryYellow;
  final Color purple;

  AppColors({
    required this.primaryBlack,
    required this.secondaryBlack,
    required this.mediumBlack,
    required this.lightBlack,
    required this.primaryYellow,
    required this.textYellow,
    required this.blue,
    required this.green,
    required this.white,
    required this.secondaryBackground,
    required this.yellow,
    required this.secondaryYellow,
    required this.purple,
  });

  static AppColors data() {
    return AppColors(
      primaryBlack: _AppColors.primaryBlack,
      secondaryBlack: _AppColors.secondaryBlack,
      mediumBlack: _AppColors.mediumBlack,
      lightBlack: _AppColors.lightBlack,
      textYellow: _AppColors.textYellow,
      primaryYellow: _AppColors.primaryYellow,
      blue: _AppColors.blue,
      green: _AppColors.green,
      white: _AppColors.white,
      secondaryBackground: _AppColors.secondaryBackground,
      yellow: _AppColors.yellow,
      secondaryYellow: _AppColors.secondaryYellow,
      purple: _AppColors.purple,
    );
  }

  static AppColors of(BuildContext context) =>
      Provider.of<AppThemeManager>(context, listen: false).theme.colorsModel;
}

class _AppColors {
  static const Color primaryBlack = Color(0xFF111111);
  static const Color secondaryBlack = Color(0xFF1A1A1A);
  static const Color mediumBlack = Color(0xFF262626);
  static const Color lightBlack = Color(0xFF333333);
  static const Color textYellow = Color(0xFFF7D917);
  static const Color primaryYellow = Color(0xFFFFb400);
  static const Color blue = Color(0xFF5C8DFF);
  static const Color green = Color(0xFF4CAF50);
  static const Color white = Color(0xFFffffff);
  static const Color secondaryBackground = Color(0xFF1E3B5B);
  static const Color yellow = Color(0xFFFFBF0A);
  static const Color secondaryYellow = Color(0xFFFFB400);
  static const Color purple = Color(0xFF4B45BD);
}
