import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

InputDecorationTheme get darkInputDecorationTheme => InputDecorationTheme(
  filled: true,
  fillColor: AppColors.darkCard,
  contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
  ),
  hintStyle: const TextStyle(color: AppColors.darkTextMuted, fontSize: 14),
  labelStyle: const TextStyle(color: AppColors.darkTextMuted, fontSize: 14, fontWeight: FontWeight.w500),
);
