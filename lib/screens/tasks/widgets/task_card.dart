import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'task_checkbox.dart';
import 'task_card_helpers.dart';

/// Styled card for displaying a single Task item.
class TaskCard extends StatelessWidget {
  /// The task model.
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
            child: TaskCardDetails(
              task: task,
              timeColor: timeColor,
              timeStyle: timeStyle,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 4,
            height: 32,
            decoration: BoxDecoration(
              color: task.getIndicatorColor(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
