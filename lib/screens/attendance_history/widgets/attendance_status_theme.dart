import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Helper mapping attendance statuses to cohesive background and foreground colors.
class AttendanceStatusTheme {
  /// Background color token.
  final Color bg;

  /// Foreground/text color token.
  final Color fg;

  /// Creates an [AttendanceStatusTheme].
  const AttendanceStatusTheme({required this.bg, required this.fg});

  /// Resolves the design colors based on the status name.
  factory AttendanceStatusTheme.resolve(String status) {
    switch (status) {
      case 'Present':
        return const AttendanceStatusTheme(
          bg: AppColors.successBackground,
          fg: AppColors.success,
        );
      case 'Late':
        return const AttendanceStatusTheme(
          bg: AppColors.warningLight,
          fg: AppColors.warningText,
        );
      case 'Half Day':
        return const AttendanceStatusTheme(
          bg: AppColors.warningTextBackground,
          fg: AppColors.warningText,
        );
      case 'On Leave':
        return const AttendanceStatusTheme(
          bg: AppColors.infoBackground,
          fg: AppColors.info,
        );
      case 'Holiday':
        return const AttendanceStatusTheme(
          bg: AppColors.accentBackground,
          fg: AppColors.accent,
        );
      case 'Week Off':
      default:
        return const AttendanceStatusTheme(
          bg: AppColors.slate100,
          fg: AppColors.slate400,
        );
    }
  }
}
