import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'task_checkbox.dart';
import 'task_type_badge.dart';

/// Styled card for displaying a single Task item.
class TaskCard extends StatelessWidget {
  final Task task;

  /// Creates a constant [TaskCard].
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final showOverdue = task.isOverdue && !task.isCompleted;
    final timeColor = showOverdue ? AppColors.errorColor : AppColors.textMuted;
    final timeStyle = TextStyle(
      color: timeColor,
      fontSize: 12,
      fontWeight: showOverdue ? FontWeight.bold : FontWeight.normal,
    );

    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          TaskCheckbox(
            isChecked: task.isCompleted,
            onTap: () => context
                .read<TasksBloc>()
                .add(ToggleTaskCompletion(task.id)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    color: task.isCompleted
                        ? AppColors.textMuted
                        : AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration:
                        task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    TaskTypeBadge(type: task.type),
                    const SizedBox(width: 8),
                    Icon(Icons.access_time_rounded, size: 12, color: timeColor),
                    const SizedBox(width: 4),
                    Text(task.time, style: timeStyle),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 4,
            height: 32,
            decoration: BoxDecoration(
              color: _getIndicatorColor(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Color _getIndicatorColor() {
    if (task.isCompleted) return const Color(0xFFCBD5E1);
    return task.priority == TaskPriority.high
        ? const Color(0xFFEF4444)
        : const Color(0xFFF97316);
  }
}
