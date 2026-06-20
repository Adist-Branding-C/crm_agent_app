import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Shadow effects for elements in the CRM Agent application.
class AppShadows {
  AppShadows._();

  /// Soft, diffuse shadow for card elements.
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: AppColors.slate900Alpha4,
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  /// Brand-tinted glow shadow for call-to-action buttons.
  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: AppColors.primaryAlpha30,
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];
}
