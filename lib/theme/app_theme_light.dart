import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_input_theme.dart';
import 'app_button_theme.dart';

/// Configures and returns the light [ThemeData] for the application.
ThemeData getLightAppTheme({String fontStyle = 'Default'}) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: AppColors.backgroundColor,
      error: AppColors.errorColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: (fontStyle == 'Default' || fontStyle == 'System')
        ? AppTextTheme.textTheme
        : AppTextTheme.getTheme(fontStyle: fontStyle),
    inputDecorationTheme: AppInputTheme.inputDecorationTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.textDark,
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
