import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'priority_chip.dart';

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
        AppSpacing.gapSm,
        Row(
          children: TaskPriority.values.map((priority) {
            final active = selectedPriorities.contains(priority);
            return PriorityChip(
              priority: priority,
              isSelected: active,
              onTap: () {
                final updated = Set<TaskPriority>.from(selectedPriorities);
                if (active) {
                  updated.remove(priority);
                } else {
                  updated.add(priority);
                }
                onChanged(updated);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
