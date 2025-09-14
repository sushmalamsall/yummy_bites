import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class AppTheme {
  static ThemeData getTheme(AppColors appColor) {
    ThemeData theme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColor.primaryBlack,
      primaryColor: appColor.primaryYellow,
    );

    TextTheme textTheme = GoogleFonts.poppinsTextTheme(theme.textTheme);

    textTheme = textTheme.copyWith(
      titleMedium: textTheme.titleMedium?.copyWith(
        color: appColor.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: textTheme.bodyLarge?.copyWith(
        color: appColor.white,
        fontSize: 15,
      ),
      bodySmall: textTheme.bodySmall?.copyWith(
        color: appColor.white,
        fontSize: 14,
        fontWeight: FontWeight.w100,
      ),
    );

    return theme.copyWith(textTheme: textTheme);
  }
}
