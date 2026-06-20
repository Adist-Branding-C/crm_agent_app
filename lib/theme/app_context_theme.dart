import 'package:flutter/material.dart';
import 'app_colors.dart';

extension ThemeColors on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBg => Theme.of(this).scaffoldBackgroundColor;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get textDark => AppColors.textDark;
  Color get textMuted => AppColors.textMuted;
  Color get primary => AppColors.primaryColor;
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get error => AppColors.errorColor;
  Color get border => AppColors.borderLight;
  Color get accent => AppColors.accent;
  Color get successBg => AppColors.successBackground;
  Color get warningBg => AppColors.warningBackground;
  Color get errorBg => AppColors.errorBackground;
  Color get info => AppColors.info;
  Color get infoBg => AppColors.infoBackground;
}
