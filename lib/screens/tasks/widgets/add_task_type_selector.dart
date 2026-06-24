import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'add_task_type_button.dart';

/// Composes the row of [TaskTypeButton]s for selecting a task category.
class AddTaskTypeSelector extends StatelessWidget {
  const AddTaskTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      buildWhen: (prev, curr) => prev.type != curr.type,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpacing.gapSm,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: TaskType.values.map((type) {
                final isSelected = state.type == type;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                    child: TaskTypeButton(
                      type: type,
                      isSelected: isSelected,
                      onTap: () {
                        context.read<AddTaskBloc>().add(TaskTypeChanged(type));
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
