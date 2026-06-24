import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Base text theme configurations for the CRM application.
const TextTheme baseTextTheme = TextTheme(
  displayLarge: TextStyle(color: AppColors.textDark, fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5),
  displayMedium: TextStyle(color: AppColors.textDark, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5),
  headlineLarge: TextStyle(color: AppColors.textDark, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5),
  headlineMedium: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -0.5),
  headlineSmall: TextStyle(color: AppColors.textDark, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.3),
  titleLarge: TextStyle(color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.bold),
  titleMedium: TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w600),
  titleSmall: TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(color: AppColors.textMuted, fontSize: 14, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.normal),
  labelLarge: TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600),
  labelMedium: TextStyle(color: AppColors.textDark, fontSize: 12, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(color: AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.w500),
);
