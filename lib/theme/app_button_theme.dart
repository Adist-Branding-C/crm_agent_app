import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
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
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          textStyle: TextStyle(fontSize: 15.s, fontWeight: FontWeight.bold),
        ),
      );

  /// Returns a button theme with text size scaled to screen width.
  static ElevatedButtonThemeData scaledElevatedButtonTheme(
    BuildContext context,
  ) {
    return ElevatedButtonThemeData(
      style: elevatedButtonTheme.style?.copyWith(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15.s,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
