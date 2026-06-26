import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'task_type_presentation_extensions.dart';

/// Styled badge displaying the task category/type.
class TaskTypeBadge extends StatelessWidget {
  final Task task;

  /// Creates a constant [TaskTypeBadge].
  const TaskTypeBadge({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final type = task.type;
    final color = task.isCompleted ? AppColors.darkTextMuted : task.type.activeColor;
    final bg =  task.type.activeBg;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(type.icon, size: 11.s, color: color),
          AppSpacing.gapWXs,
          Text(
            type.label,
            style: 
            (task.isCompleted
              ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 10.s
                )
              : TextStyle(
                  fontSize: 10.s,
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 0.4.w
                )),
          ),
        ],
      ),
    );
  }
}
