import 'package:flutter/material.dart';
import '../utils/text_scaler.dart';
import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.textDark, fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      color: AppColors.textDark, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5,
    ),
    headlineLarge: TextStyle(
      color: AppColors.textDark, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -0.5,
    ),
    headlineSmall: TextStyle(
      color: AppColors.textDark, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.3,
    ),
    titleLarge: TextStyle(
      color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textMuted, fontSize: 14, fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: AppColors.textDark, fontSize: 12, fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme scaledTextTheme(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(fontSize: AppTextScaler.scale(width, 32)),
      displayMedium: textTheme.displayMedium?.copyWith(fontSize: AppTextScaler.scale(width, 28)),
      headlineLarge: textTheme.headlineLarge?.copyWith(fontSize: AppTextScaler.scale(width, 26)),
      headlineMedium: textTheme.headlineMedium?.copyWith(fontSize: AppTextScaler.scale(width, 24)),
      headlineSmall: textTheme.headlineSmall?.copyWith(fontSize: AppTextScaler.scale(width, 20)),
      titleLarge: textTheme.titleLarge?.copyWith(fontSize: AppTextScaler.scale(width, 18)),
      titleMedium: textTheme.titleMedium?.copyWith(fontSize: AppTextScaler.scale(width, 16)),
      titleSmall: textTheme.titleSmall?.copyWith(fontSize: AppTextScaler.scale(width, 14)),
      bodyLarge: textTheme.bodyLarge?.copyWith(fontSize: AppTextScaler.scale(width, 16)),
      bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: AppTextScaler.scale(width, 14)),
      bodySmall: textTheme.bodySmall?.copyWith(fontSize: AppTextScaler.scale(width, 12)),
      labelLarge: textTheme.labelLarge?.copyWith(fontSize: AppTextScaler.scale(width, 14)),
      labelMedium: textTheme.labelMedium?.copyWith(fontSize: AppTextScaler.scale(width, 12)),
      labelSmall: textTheme.labelSmall?.copyWith(fontSize: AppTextScaler.scale(width, 11)),
    );
  }
}
