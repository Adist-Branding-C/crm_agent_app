import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_button_theme.dart';
import 'app_input_theme_dark.dart';

/// Configures and returns the dark [ThemeData] for the application.
ThemeData getDarkAppTheme({String fontStyle = 'Default'}) {
  final customTextTheme = (fontStyle == 'Default' || fontStyle == 'System')
      ? AppTextTheme.textTheme
      : AppTextTheme.getTheme(fontStyle: fontStyle);
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
    textTheme: customTextTheme.copyWith(
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
    inputDecorationTheme: darkInputDecorationTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkSurface,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    ),
  );
}
