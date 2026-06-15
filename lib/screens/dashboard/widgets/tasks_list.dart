import 'package:flutter/material.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../theme.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const Text(
                'View all',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppTheme.cardShadow,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFFF1F5F9),
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
