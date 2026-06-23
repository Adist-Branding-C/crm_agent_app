import 'package:flutter/material.dart';
import '../utils/text_scaler.dart';
import 'app_colors.dart';

/// Global theme configurations for text input elements.
class AppInputTheme {
  AppInputTheme._();

  /// Retrieves the standardized InputDecorationTheme configuration.
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.borderLight, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.borderLight, width: 1),
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
    hintStyle: const TextStyle(
      color: AppColors.textMuted,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelStyle: const TextStyle(
      color: AppColors.textMuted,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  /// Returns an input theme with hint/label text size scaled to screen width.
  static InputDecorationTheme scaledInputDecorationTheme(
      BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return inputDecorationTheme.copyWith(
      hintStyle: TextStyle(
        color: AppColors.textMuted,
        fontSize: AppTextScaler.scale(w, 14),
        fontWeight: FontWeight.normal,
      ),
      labelStyle: TextStyle(
        color: AppColors.textMuted,
        fontSize: AppTextScaler.scale(w, 14),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
