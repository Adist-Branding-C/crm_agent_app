import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import 'task_details_bottom_sheet_widgets.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'task_type_badge.dart';
import 'task_priority_extensions.dart';

import '../../../widgets/bottom_sheet_handle.dart';

class TaskDetailsBottomSheet extends StatelessWidget {
  final Task task;
  const TaskDetailsBottomSheet({super.key, required this.task});

  static Future<void> show(BuildContext context, Task task) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => BlocProvider.value(
          value: context.read<TasksBloc>(),
          child: TaskDetailsBottomSheet(task: task),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final parts = task.title.split(RegExp(r'\s*[\u2014-]\s*'));
    final contactName = parts.length > 1 ? parts.last.trim() : null;
    final priorityBg = switch (task.priority) {
      TaskPriority.high => AppColors.errorBackground,
      TaskPriority.medium => AppColors.warningTextBackground,
      TaskPriority.low => AppColors.slate100,
    };
    return Container(
      
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0.w)),
      ),
      padding:  EdgeInsets.fromLTRB(17.0.w, 20.0.h, 17.0.w, 40.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: BottomSheetHandle()),
          AppSpacing.gapLg,
          Row(
            children: [
              TaskTypeBadge(task: task),
              AppSpacing.gapWSm,
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.0.h),
                decoration: BoxDecoration(color: priorityBg, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  task.priority.label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: task.priority.displayColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          AppSpacing.gapXl,
          Text(
            task.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (task.description != null && task.description!.isNotEmpty) ...[
            AppSpacing.gapXs,
            Text(
              task.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          AppSpacing.gapXl,
          TaskDetailsInfoRow(icon: Icons.access_time_rounded, text: task.time),
          if (contactName != null) ...[
            AppSpacing.gapSm,
            TaskDetailsInfoRow(icon: Icons.person_outline_rounded, text: contactName),
          ],
          AppSpacing.gapXxxl,
          TaskDetailsActionBtn(taskId: task.id, isCompleted: task.isCompleted),
        ],
      ),
    );
  }
}
