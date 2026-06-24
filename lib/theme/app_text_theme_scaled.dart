import 'package:flutter/material.dart';
import '../utils/text_scaler.dart';
import 'app_text_theme.dart';

/// Returns a [TextTheme] with all font sizes scaled dynamically.
TextTheme getScaledTextTheme(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  final textTheme = AppTextTheme.textTheme;
  return textTheme.copyWith(
    displayLarge: textTheme.displayLarge?.copyWith(
      fontSize: AppTextScaler.scale(width, 32),
    ),
    displayMedium: textTheme.displayMedium?.copyWith(
      fontSize: AppTextScaler.scale(width, 28),
    ),
    headlineLarge: textTheme.headlineLarge?.copyWith(
      fontSize: AppTextScaler.scale(width, 26),
    ),
    headlineMedium: textTheme.headlineMedium?.copyWith(
      fontSize: AppTextScaler.scale(width, 24),
    ),
    headlineSmall: textTheme.headlineSmall?.copyWith(
      fontSize: AppTextScaler.scale(width, 20),
    ),
    titleLarge: textTheme.titleLarge?.copyWith(
      fontSize: AppTextScaler.scale(width, 18),
    ),
    titleMedium: textTheme.titleMedium?.copyWith(
      fontSize: AppTextScaler.scale(width, 16),
    ),
    titleSmall: textTheme.titleSmall?.copyWith(
      fontSize: AppTextScaler.scale(width, 14),
    ),
    bodyLarge: textTheme.bodyLarge?.copyWith(
      fontSize: AppTextScaler.scale(width, 16),
    ),
    bodyMedium: textTheme.bodyMedium?.copyWith(
      fontSize: AppTextScaler.scale(width, 14),
    ),
    bodySmall: textTheme.bodySmall?.copyWith(
      fontSize: AppTextScaler.scale(width, 12),
    ),
    labelLarge: textTheme.labelLarge?.copyWith(
      fontSize: AppTextScaler.scale(width, 14),
    ),
    labelMedium: textTheme.labelMedium?.copyWith(
      fontSize: AppTextScaler.scale(width, 12),
    ),
    labelSmall: textTheme.labelSmall?.copyWith(
      fontSize: AppTextScaler.scale(width, 11),
    ),
  );
}
