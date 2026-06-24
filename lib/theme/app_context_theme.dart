import 'package:flutter/material.dart';
import 'app_colors.dart';

extension ThemeColors on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBg => Theme.of(this).scaffoldBackgroundColor;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  Color get textDark => _isDark ? AppColors.darkText : AppColors.textDark;
  Color get textMuted =>
      _isDark ? AppColors.darkTextMuted : AppColors.textMuted;
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get success => _isDark ? AppColors.successDark : AppColors.success;
  Color get warning => _isDark ? AppColors.warningDark : AppColors.warning;
  Color get error => Theme.of(this).colorScheme.error;
  Color get border => _isDark ? AppColors.darkBorder : AppColors.borderLight;
  Color get accent => AppColors.accent;
  Color get successBg =>
      _isDark ? AppColors.successIconBg : AppColors.successBackground;
  Color get warningBg =>
      _isDark ? AppColors.warningTextBackground : AppColors.warningBackground;
  Color get errorBg =>
      _isDark ? AppColors.darkSurface : AppColors.errorBackground;
  Color get info => AppColors.info;
  Color get infoBg =>
      _isDark ? AppColors.infoBackground : AppColors.infoBackground;
}
