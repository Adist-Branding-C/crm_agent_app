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
        padding: AppSpacing.cardPaddingCompact,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.type.label,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.gapXs,
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    task.time,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            if (showCall) ...[
              AppSpacing.gapWSm,
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
