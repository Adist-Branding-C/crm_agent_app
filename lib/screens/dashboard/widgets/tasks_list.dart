import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/section_header.dart';
import 'task_row.dart';

/// Renders the entire Tasks list container with headers.
class TasksList extends StatelessWidget {
  final List<TaskItem> tasks;

  /// Creates a constant [TasksList].
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Tasks',
            actionText: 'View all',
            onActionTap: () => context.go('${AppRoutes.dashboardPath}?tab=tasks'),
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
                return TaskRow(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
