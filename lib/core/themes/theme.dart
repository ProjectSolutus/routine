import 'package:flutter/material.dart';
import '../colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      onBackground: AppColors.lightOnBackground,
      onSurface: AppColors.lightOnSurface,
      onPrimary: AppColors.lightOnPrimary,
      onSecondary: AppColors.lightOnSecondary,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      background: AppColors.darkBackground,
      surface: AppColors.darkSurface,
      onBackground: AppColors.darkOnBackground,
      onSurface: AppColors.darkOnSurface,
      onPrimary: AppColors.darkOnPrimary,
      onSecondary: AppColors.darkOnSecondary,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
  );
}
