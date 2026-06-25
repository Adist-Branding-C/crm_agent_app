import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Base text theme configurations for the CRM application.
const TextTheme baseTextTheme = TextTheme(
  displayLarge: TextStyle(color: AppColors.textDark, fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -0.55),
  displayMedium: TextStyle(color: AppColors.textDark, fontSize: 26, fontWeight: FontWeight.w700),
  headlineLarge: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.w700),
  headlineMedium: TextStyle(color: AppColors.textDark, fontSize: 22, fontWeight: FontWeight.w700),
  headlineSmall: TextStyle(color: AppColors.textDark, fontSize: 21, fontWeight: FontWeight.w700),
  titleLarge: TextStyle(color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.w700),
  titleMedium: TextStyle(color: AppColors.textDark, fontSize: 17, fontWeight: FontWeight.w600),
  titleSmall: TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(color: AppColors.textDark, fontSize: 15, fontWeight: FontWeight.w500),
  bodyMedium: TextStyle(color: AppColors.textMuted, fontSize: 14.5, fontWeight: FontWeight.w500),
  bodySmall: TextStyle(color: AppColors.textMuted, fontSize: 12.5, fontWeight: FontWeight.w500),
  labelLarge: TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600),
  labelMedium: TextStyle(color: AppColors.textDark, fontSize: 13.5, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(color: AppColors.textMuted, fontSize: 11.5, fontWeight: FontWeight.w500),
);
