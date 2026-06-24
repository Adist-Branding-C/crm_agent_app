import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'task_priority_extensions.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'task_meta_row.dart';

class TaskDetailsBody extends StatelessWidget {
  final Task task;
  const TaskDetailsBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.type.name.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              if (task.isOverdue && !task.isCompleted)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.ten,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.errorBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'OVERDUE',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.errorColor,
                    ),
                  ),
                ),
            ],
          ),
          AppSpacing.gapXl,
          Text(task.title, style: Theme.of(context).textTheme.titleLarge),
          AppSpacing.gapMd,
          TaskMetaRow(
            label: 'Due Time',
            value: task.time,
            icon: Icons.access_time_rounded,
          ),
          TaskMetaRow(
            label: 'Priority',
            value: task.priority.name.toUpperCase(),
            icon: Icons.priority_high_rounded,
            color: task.priority.displayColor,
          ),
          AppSpacing.gapXxxl,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: task.isCompleted
                    ? AppColors.slate300
                    : AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.fourteen),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () =>
                  context.read<TasksBloc>().add(ToggleTaskCompletion(task.id)),
              icon: Icon(
                task.isCompleted
                    ? Icons.check_circle_outline_rounded
                    : Icons.check_circle_rounded,
              ),
              label: Text(
                task.isCompleted ? 'Mark Incomplete' : 'Mark Completed',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
