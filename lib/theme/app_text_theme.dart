import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Global text styling definitions for the application text theme.
class AppTextTheme {
  AppTextTheme._();

  /// Retrieves the standardized TextTheme configuration.
  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.textDark,
      fontSize: 32,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    titleMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.textDark,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textMuted,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      color: AppColors.textDark,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}
