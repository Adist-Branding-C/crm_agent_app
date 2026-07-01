import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'task_type_badge.dart';

/// Extension on [Task] to retrieve its priority/status indicator color.
extension TaskColorExtension on Task {
  /// Resolves the indicator color for the task card.
  Color getIndicatorColor() {
    if (isCompleted) return AppColors.slate300;
    return priority == TaskPriority.high
        ? AppColors.errorColor
        : AppColors.warningText;
  }
}

/// Renders the title, type badge, and due time for a Task.
class TaskCardDetails extends StatelessWidget {
  /// The task model.
  final Task task;

  /// The color of the time text.
  final Color timeColor;

  /// The text style of the time text.
  final TextStyle timeStyle;

  /// Creates a [TaskCardDetails] widget.
  const TaskCardDetails({
    super.key,
    required this.task,
    required this.timeColor,
    required this.timeStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: task.isCompleted ? AppColors.textMuted : AppColors.textDark,
                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              ),
        ),
        AppSpacing.gapXs,
        Row(
          children: [
            TaskTypeBadge(task: task),
            AppSpacing.gapWSm,
            Icon(Icons.access_time_rounded, size: 12.s, color: timeColor),
            AppSpacing.gapWXs,
            Expanded(
              child: Text(
                task.time,
                style: task.isCompleted
                    ? timeStyle.copyWith(decoration: TextDecoration.lineThrough)
                    : timeStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
