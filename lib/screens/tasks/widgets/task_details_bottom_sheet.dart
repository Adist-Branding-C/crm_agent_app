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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(17.0, 11.0, 17.0, 29.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: BottomSheetHandle()),
          AppSpacing.gapLg,
          Row(
            children: [
              TaskTypeBadge(type: task.type),
              AppSpacing.gapWSm,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: priorityBg, borderRadius: BorderRadius.circular(6)),
                child: Text(task.priority.label, style: TextStyle(color: task.priority.displayColor, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          AppSpacing.gapMd,
          Text(task.title, style: Theme.of(context).textTheme.headlineSmall),
          if (task.description != null && task.description!.isNotEmpty) ...[
            AppSpacing.gapSm,
            Text(task.description!, style: Theme.of(context).textTheme.bodyMedium),
          ],
          AppSpacing.gapLg,
          TaskDetailsInfoRow(icon: Icons.access_time_rounded, text: task.time),
          if (contactName != null) ...[
            AppSpacing.gapSm,
            TaskDetailsInfoRow(icon: Icons.person_outline_rounded, text: contactName),
          ],
          AppSpacing.gapXl,
          TaskDetailsActionBtn(taskId: task.id, isCompleted: task.isCompleted),
        ],
      ),
    );
  }
}
