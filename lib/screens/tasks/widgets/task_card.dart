import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'task_checkbox.dart';
import 'task_card_helpers.dart';
import 'task_details_bottom_sheet.dart';

class TaskCard extends StatelessWidget {
  final Task task;
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
      margin: AppSpacing.cardMarginList,
      padding: AppSpacing.cardPadding,
      onTap: () => TaskDetailsBottomSheet.show(context, task),
      child: Row(
        children: [
          TaskCheckbox(
            isChecked: task.isCompleted,
            onTap: () =>
                context.read<TasksBloc>().add(ToggleTaskCompletion(task.id)),
          ),
          AppSpacing.gapWLg,
          Expanded(
            child: TaskCardDetails(
              task: task,
              timeColor: timeColor,
              timeStyle: timeStyle,
            ),
          ),
          AppSpacing.gapWMd,
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
