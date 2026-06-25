import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/app_scaled_theme.dart';
import 'theme/app_theme_light.dart';
import 'theme/app_theme_dark.dart';

export 'theme/app_colors.dart';
export 'theme/app_spacing.dart';
export 'package:flutter_sfs/flutter_sfs.dart';

/// Centralized manager for application Light and Dark themes.
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

  /// Returns light [ThemeData].
  static ThemeData get lightTheme => getLightAppTheme();

  /// Returns dark [ThemeData].
  static ThemeData get darkTheme => getDarkAppTheme();

  /// Returns light [ThemeData] scaled to the screen width.
  static ThemeData scaledLightTheme(BuildContext context) =>
      getScaledLightTheme(context);
}
