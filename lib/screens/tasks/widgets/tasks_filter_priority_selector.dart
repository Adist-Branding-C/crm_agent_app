import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import '../../../widgets/colored_dot.dart';
import 'task_priority_extensions.dart';

/// Selection widget for priorities inside the filter bottom sheet.
class TasksFilterPrioritySelector extends StatelessWidget {
  final Set<TaskPriority> selectedPriorities;
  final ValueChanged<Set<TaskPriority>> onChanged;

  const TasksFilterPrioritySelector({
    super.key,
    required this.selectedPriorities,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PRIORITY',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: TaskPriority.values.map((priority) {
            final active = selectedPriorities.contains(priority);
            final dotColor =
                priority == TaskPriority.low ? AppColors.slate400 : priority.displayColor;
            final activeBg = switch (priority) {
              TaskPriority.high => AppColors.errorBackground,
              TaskPriority.medium => AppColors.warningTextBackground,
              TaskPriority.low => AppColors.slate100,
            };

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  final updated = Set<TaskPriority>.from(selectedPriorities);
                  if (active) {
                    updated.remove(priority);
                  } else {
                    updated.add(priority);
                  }
                  onChanged(updated);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: active ? activeBg : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: active ? priority.displayColor : AppColors.slate300,
                      width: active ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColoredDot(color: dotColor, size: 8),
                      const SizedBox(width: 8),
                      Text(
                        priority.label,
                        style: TextStyle(
                          color: active ? priority.displayColor : AppColors.textMuted,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
