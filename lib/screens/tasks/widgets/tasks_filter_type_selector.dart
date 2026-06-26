import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'add_task_type_button.dart';

/// Selection widget for task types inside the filter bottom sheet.
class TasksFilterTypeSelector extends StatelessWidget {
  final Set<TaskType> selectedTypes;
  final ValueChanged<Set<TaskType>> onChanged;

  const TasksFilterTypeSelector({
    super.key,
    required this.selectedTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'TASK TYPE',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11.s,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8.w,
          ),
        ),
         SizedBox(height: 10.h),
        Row(
          
          children: TaskType.values.map((type) {
            final active = selectedTypes.contains(type);
            return Expanded(
              child: Container(
                height: 45.h,
                padding: EdgeInsets.only(right: AppSpacing.md+2.w),
                child: TaskTypeButton(
                  type: type,
                  isSelected: active,
                  onTap: () {
                    final updated = Set<TaskType>.from(selectedTypes);
                    if (active) {
                      updated.remove(type);
                    } else {
                      updated.add(type);
                    }
                    onChanged(updated);
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
