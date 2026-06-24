import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_button_theme.dart';
import 'app_spacing.dart';

/// Configures and returns the dark [ThemeData] for the application.
ThemeData getDarkAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: AppColors.darkSurface,
      error: AppColors.errorColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.darkText),
      titleTextStyle: TextStyle(
        color: AppColors.darkText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: AppTextTheme.textTheme.copyWith(
      displayLarge: const TextStyle(color: AppColors.darkText),
      displayMedium: const TextStyle(color: AppColors.darkText),
      headlineLarge: const TextStyle(color: AppColors.darkText),
      headlineMedium: const TextStyle(color: AppColors.darkText),
      headlineSmall: const TextStyle(color: AppColors.darkText),
      titleLarge: const TextStyle(color: AppColors.darkText),
      titleMedium: const TextStyle(color: AppColors.darkText),
      titleSmall: const TextStyle(color: AppColors.darkText),
      bodyLarge: const TextStyle(color: AppColors.darkText),
      bodyMedium: const TextStyle(color: AppColors.darkTextMuted),
      bodySmall: const TextStyle(color: AppColors.darkTextMuted),
      labelLarge: const TextStyle(color: AppColors.darkText),
      labelMedium: const TextStyle(color: AppColors.darkText),
      labelSmall: const TextStyle(color: AppColors.darkTextMuted),
    ),
    inputDecorationTheme: InputDecorationTheme(
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
    ),
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkSurface,
      contentTextStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  );
}
