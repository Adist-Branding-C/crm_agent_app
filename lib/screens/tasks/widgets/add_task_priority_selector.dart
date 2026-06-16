import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';

/// Renders the custom segmented priority control (High, Medium, Low).
class AddTaskPrioritySelector extends StatelessWidget {
  const AddTaskPrioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      buildWhen: (prev, curr) => prev.priority != curr.priority,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Priority',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: TaskPriority.values.map((priority) {
                  final isSelected = state.priority == priority;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<AddTaskBloc>()
                            .add(TaskPriorityChanged(priority));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: isSelected ? AppTheme.cardShadow : null,
                        ),
                        child: Text(
                          _getLabel(priority),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.textDark
                                : AppColors.textMuted,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getLabel(TaskPriority priority) {
    return switch (priority) {
      TaskPriority.high => 'High',
      TaskPriority.medium => 'Medium',
      TaskPriority.low => 'Low',
    };
  }
}
