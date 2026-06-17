import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'tasks_models.dart';

/// Extension providing display colors for [TaskPriority].
extension TaskPriorityDisplayColor on TaskPriority {
  Color get displayColor {
    switch (this) {
      case TaskPriority.high:
        return AppColors.errorColor;
      case TaskPriority.medium:
        return AppColors.warningText;
      case TaskPriority.low:
        return AppColors.success;
    }
  }
}
