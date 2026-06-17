import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/call_button.dart';

/// Renders a single row representing a task item.
class TaskRow extends StatelessWidget {
  final Task task;

  /// Callback invoked when the task row is tapped.
  final VoidCallback? onTap;

  /// Creates a constant [TaskRow].
  const TaskRow({super.key, required this.task, this.onTap});

  @override
  Widget build(BuildContext context) {
    final showCall = task.type == TaskType.call;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.type.label,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.title,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    task.time,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (showCall) ...[
              const SizedBox(width: 8),
              CallButton(
                onTap: () => context.read<CallLogBloc>().add(
                      InitiateCallByName(name: task.title),
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
