import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme/app_colors.dart';

extension TaskPriorityExtension on TaskPriority {
  String get label => switch (this) {
    TaskPriority.high => 'High',
    TaskPriority.medium => 'Medium',
    TaskPriority.low => 'Low',
  };

  Color get displayColor => switch (this) {
    TaskPriority.high => AppColors.errorColor,
    TaskPriority.medium => AppColors.warningText,
    TaskPriority.low => AppColors.success,
  };
}
