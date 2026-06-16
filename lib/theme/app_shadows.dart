import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Shadow effects for elements in the CRM Agent application.
class AppShadows {
  AppShadows._();

  /// Generates a soft, diffuse shadow for card elements.
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: AppColors.slate900.withValues(alpha: 0.04),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  /// Generates a brand-tinted glow shadow for call-to-action buttons.
  static List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: AppColors.primaryColor.withValues(alpha: 0.25),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}
