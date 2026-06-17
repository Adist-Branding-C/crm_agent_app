import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../bloc/tasks/tasks_models.dart';

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
