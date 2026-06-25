import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/section_header.dart';
import '../../dashboard/dashboard_tab_notifier.dart';
import '../../../theme.dart';
import '../../tasks/widgets/task_details_bottom_sheet.dart';
import 'task_row.dart';

/// Renders the entire Tasks list container with headers.
class TasksList extends StatelessWidget {
  final List<Task> tasks;

  /// Creates a constant [TasksList].
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Tasks',
            actionText: 'View all',
            onActionTap: () => context.read<DashboardTabNotifier>().setIndex(2),
          ),
          const SizedBox(height: 12),
          CustomCard(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.slate100,
                height: 1,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return TaskRow(
                  task: tasks[index],
                  onTap: () => TaskDetailsBottomSheet.show(context, tasks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
