import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../theme.dart';

/// Configuration for timeline icon based on activity type.
class ActivityIconConfig {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const ActivityIconConfig({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}

/// Returns the icon configuration for a given [ActivityTypeFilter].
ActivityIconConfig getActivityIconConfig(ActivityTypeFilter type) {
  switch (type) {
    case ActivityTypeFilter.call:
      return const ActivityIconConfig(
        icon: Icons.phone_rounded,
        iconColor: AppColors.success,
        bgColor: AppColors.successBackground,
      );
    case ActivityTypeFilter.task:
      return const ActivityIconConfig(
        icon: Icons.check_circle_outline_rounded,
        iconColor: AppColors.success,
        bgColor: AppColors.successBackground,
      );
    case ActivityTypeFilter.deal:
      return const ActivityIconConfig(
        icon: Icons.work_outline_rounded,
        iconColor: AppColors.warning,
        bgColor: AppColors.warningBackground,
      );
    case ActivityTypeFilter.lead:
      return const ActivityIconConfig(
        icon: Icons.person_outline_rounded,
        iconColor: AppColors.errorColor,
        bgColor: AppColors.errorBackground,
      );
    case ActivityTypeFilter.all:
      return const ActivityIconConfig(
        icon: Icons.circle,
        iconColor: AppColors.textMuted,
        bgColor: AppColors.slate100,
      );
  }
}
