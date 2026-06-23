import 'package:flutter/material.dart';
import '../utils/text_scaler.dart';
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

  /// Returns a button theme with text size scaled to screen width.
  static ElevatedButtonThemeData scaledElevatedButtonTheme(
      BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return ElevatedButtonThemeData(
      style: elevatedButtonTheme.style?.copyWith(
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: AppTextScaler.scale(w, 16), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
