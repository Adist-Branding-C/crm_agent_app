import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/section_header.dart';
import '../../dashboard/dashboard_tab_notifier.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                  onTap: () {
                    context.read<DashboardTabNotifier>().setIndex(2);
                    context.read<TasksBloc>().add(
                      const FilterChanged(TasksFilter.pending),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
