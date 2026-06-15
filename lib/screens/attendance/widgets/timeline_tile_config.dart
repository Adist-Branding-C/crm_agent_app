import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';

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
          iconColor: Color(0xFF10B981),
          bgColor: Color(0xFFECFDF5),
        );
      case AttendanceActivityType.call:
        return const TimelineTileConfig(
          icon: Icons.phone_outlined,
          iconColor: Color(0xFF10B981),
          bgColor: Color(0xFFECFDF5),
        );
      case AttendanceActivityType.note:
        return const TimelineTileConfig(
          icon: Icons.description_outlined,
          iconColor: Color(0xFF3B82F6),
          bgColor: Color(0xFFEFF6FF),
        );
      case AttendanceActivityType.lead:
        return const TimelineTileConfig(
          icon: Icons.person_add_alt_1_outlined,
          iconColor: Color(0xFFEF4444),
          bgColor: Color(0xFFFEF2F2),
        );
      case AttendanceActivityType.lunchBreak:
        return const TimelineTileConfig(
          icon: Icons.local_cafe_outlined,
          iconColor: Color(0xFFF59E0B),
          bgColor: Color(0xFFFFFBEB),
        );
      case AttendanceActivityType.statusChange:
        return const TimelineTileConfig(
          icon: Icons.sync_rounded,
          iconColor: Color(0xFF8B5CF6),
          bgColor: Color(0xFFF5F3FF),
        );
      case AttendanceActivityType.dealWon:
        return const TimelineTileConfig(
          icon: Icons.work_outline_rounded,
          iconColor: Color(0xFF10B981),
          bgColor: Color(0xFFECFDF5),
        );
    }
  }
}
