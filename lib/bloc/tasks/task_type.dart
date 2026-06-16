import '../../theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Type of task item.
enum TaskType {
  task('Task'),
  meeting('Meeting'),
  call('Call'),
  deal('Deal');

  final String label;
  const TaskType(this.label);
}

/// Extension on [TaskType] to provide UI/theme configurations.
extension TaskTypeThemeConfig on TaskType {
  /// Resolves the icon for this task type.
  IconData get icon {
    return switch (this) {
      TaskType.task => Icons.check_box_outlined,
      TaskType.meeting => Icons.people_outline_rounded,
      TaskType.call => Icons.phone_outlined,
      TaskType.deal => Icons.business_center_outlined,
    };
  }

  /// Resolves the active theme color for this task type.
  Color get activeColor {
    return switch (this) {
      TaskType.task => AppColors.info,
      TaskType.meeting => AppColors.accent,
      TaskType.call => AppColors.success,
      TaskType.deal => AppColors.warning,
    };
  }

  /// Resolves the active background theme color for this task type.
  Color get activeBg {
    return switch (this) {
      TaskType.task => AppColors.infoBackground,
      TaskType.meeting => AppColors.accentBackground,
      TaskType.call => AppColors.successBackground,
      TaskType.deal => AppColors.warningBackground,
    };
  }
}
