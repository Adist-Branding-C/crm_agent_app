import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'task_priority_extensions.dart';


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
            Text(
              'Priority',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 12.s
              ),
            ),
            AppSpacing.gapSm,
            Container(
              padding: EdgeInsets.all(AppSpacing.xs2),
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: TaskPriority.values.map((priority) {
                  final isSelected = state.priority == priority;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AddTaskBloc>().add(
                          TaskPriorityChanged(priority),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          priority.label,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected
                                ? AppColors.textDark
                                : AppColors.textMuted,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 13.s,
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
}
