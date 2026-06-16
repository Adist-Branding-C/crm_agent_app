import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';

/// Styled badge displaying the task category/type.
class TaskTypeBadge extends StatelessWidget {
  final TaskType type;

  /// Creates a constant [TaskTypeBadge].
  const TaskTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final (icon, color, bg) = switch (type) {
      TaskType.task => (
          Icons.check_box_outlined,
          AppColors.info,
          AppColors.infoBackground
        ),
      TaskType.meeting => (
          Icons.people_outline_rounded,
          AppColors.accent,
          AppColors.accentBackground
        ),
      TaskType.call => (
          Icons.phone_outlined,
          AppColors.success,
          AppColors.successBackground
        ),
      TaskType.deal => (
          Icons.business_center_outlined,
          AppColors.warning,
          AppColors.warningBackground
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            type.label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
