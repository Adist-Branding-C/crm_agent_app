import 'package:flutter/material.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../theme.dart';
import 'call_button.dart';

/// Renders a single row representing a task item.
class TaskRow extends StatelessWidget {
  final TaskItem task;

  /// Creates a constant [TaskRow].
  const TaskRow({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final showCall = task.type.toLowerCase() == 'call';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.type,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.name,
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
          if (showCall) ...[const SizedBox(width: 8), const CallButton()],
        ],
      ),
    );
  }
}
