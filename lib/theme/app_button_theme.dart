import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Global theme configurations for button elements.
class AppButtonTheme {
  AppButtonTheme._();

  /// Retrieves the standardized ElevatedButtonThemeData configuration.
  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
}
