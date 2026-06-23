import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/app_shadows.dart';
import 'theme/app_text_theme.dart';
import 'theme/app_input_theme.dart';
import 'theme/app_button_theme.dart';


import 'theme/app_scaled_theme.dart';

export 'theme/app_colors.dart';
export 'theme/app_shadows.dart';

/// Centralized visual design configuration for the CRM Agent app.
class AppTheme {
  AppTheme._();

  // Backward compatibility static aliases
  static const Color primaryColor = AppColors.primaryColor;
  static const Color primaryColorLight = AppColors.primaryColorLight;
  static const Color backgroundColor = AppColors.backgroundColor;
  static const Color textDark = AppColors.textDark;
  static const Color textMuted = AppColors.textMuted;
  static const Color borderLight = AppColors.borderLight;
  static const Color errorColor = AppColors.errorColor;
  static const Color errorBackground = AppColors.errorBackground;

  /// Card shadow effects delegate.
  static List<BoxShadow> get cardShadow => AppShadows.cardShadow;

  /// Button shadow effects delegate.
  static List<BoxShadow> get buttonShadow => AppShadows.buttonShadow;

  /// Generates the application light theme.
  static ThemeData get lightTheme {
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
      textTheme: AppTextTheme.textTheme,
      inputDecorationTheme: AppInputTheme.inputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    );
  }

  /// Returns a ThemeData with font sizes scaled to the screen width.
  static ThemeData scaledLightTheme(BuildContext context) => getScaledLightTheme(context);
}
