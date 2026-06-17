import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/timeline_tile_config.dart';

/// OCP-compliant registry mapping activity types to timeline tile configs.
class AttendanceTimelineConfigs {
  AttendanceTimelineConfigs._();

  static const Map<AttendanceActivityType, TimelineTileConfig> _registry = {
    AttendanceActivityType.checkIn: TimelineTileConfig(icon: Icons.login_rounded, iconColor: AppColors.success, bgColor: AppColors.successBackground),
    AttendanceActivityType.call: TimelineTileConfig(icon: Icons.phone_outlined, iconColor: AppColors.success, bgColor: AppColors.successBackground),
    AttendanceActivityType.note: TimelineTileConfig(icon: Icons.description_outlined, iconColor: AppColors.info, bgColor: AppColors.infoBackground),
    AttendanceActivityType.lead: TimelineTileConfig(icon: Icons.person_add_alt_1_outlined, iconColor: AppColors.errorColor, bgColor: AppColors.errorBackground),
    AttendanceActivityType.lunchBreak: TimelineTileConfig(icon: Icons.local_cafe_outlined, iconColor: AppColors.warning, bgColor: AppColors.warningBackground),
    AttendanceActivityType.statusChange: TimelineTileConfig(icon: Icons.sync_rounded, iconColor: AppColors.accent, bgColor: AppColors.accentBackground),
    AttendanceActivityType.dealWon: TimelineTileConfig(icon: Icons.work_outline_rounded, iconColor: AppColors.success, bgColor: AppColors.successBackground),
  };

  static TimelineTileConfig getConfig(AttendanceActivityType type) {
    return _registry[type] ?? const TimelineTileConfig(icon: Icons.circle, iconColor: AppColors.textMuted, bgColor: AppColors.slate100);
  }
}
