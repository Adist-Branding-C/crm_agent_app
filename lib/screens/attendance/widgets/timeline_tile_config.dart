import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';

/// Configuration details for a timeline event type.
class TimelineTileConfig {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const TimelineTileConfig({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });

  /// Resolves the theme config for a specific activity type.
  static TimelineTileConfig getConfig(AttendanceActivityType type) {
    switch (type) {
      case AttendanceActivityType.checkIn:
        return const TimelineTileConfig(
          icon: Icons.login_rounded,
          iconColor: AppColors.success,
          bgColor: AppColors.successBackground,
        );
      case AttendanceActivityType.call:
        return const TimelineTileConfig(
          icon: Icons.phone_outlined,
          iconColor: AppColors.success,
          bgColor: AppColors.successBackground,
        );
      case AttendanceActivityType.note:
        return const TimelineTileConfig(
          icon: Icons.description_outlined,
          iconColor: AppColors.info,
          bgColor: AppColors.infoBackground,
        );
      case AttendanceActivityType.lead:
        return const TimelineTileConfig(
          icon: Icons.person_add_alt_1_outlined,
          iconColor: AppColors.errorColor,
          bgColor: AppColors.errorBackground,
        );
      case AttendanceActivityType.lunchBreak:
        return const TimelineTileConfig(
          icon: Icons.local_cafe_outlined,
          iconColor: AppColors.warning,
          bgColor: AppColors.warningBackground,
        );
      case AttendanceActivityType.statusChange:
        return const TimelineTileConfig(
          icon: Icons.sync_rounded,
          iconColor: AppColors.accent,
          bgColor: AppColors.accentBackground,
        );
      case AttendanceActivityType.dealWon:
        return const TimelineTileConfig(
          icon: Icons.work_outline_rounded,
          iconColor: AppColors.success,
          bgColor: AppColors.successBackground,
        );
    }
  }
}
