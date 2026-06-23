import 'package:flutter/material.dart';
import '../utils/text_scaler.dart';
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

  /// Returns a TextTheme with font sizes scaled to the screen width.
  static TextTheme scaledTextTheme(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(
        fontSize: AppTextScaler.scale(width, 32),
      ),
      headlineMedium: textTheme.headlineMedium?.copyWith(
        fontSize: AppTextScaler.scale(width, 24),
      ),
      titleMedium: textTheme.titleMedium?.copyWith(
        fontSize: AppTextScaler.scale(width, 16),
      ),
      bodyLarge: textTheme.bodyLarge?.copyWith(
        fontSize: AppTextScaler.scale(width, 16),
      ),
      bodyMedium: textTheme.bodyMedium?.copyWith(
        fontSize: AppTextScaler.scale(width, 14),
      ),
      labelLarge: textTheme.labelLarge?.copyWith(
        fontSize: AppTextScaler.scale(width, 14),
      ),
    );
  }
}
