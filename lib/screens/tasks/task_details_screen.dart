import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../bloc/tasks/tasks_models.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/task_details_body.dart';

/// Screen representing task detail page.
class TaskDetailsScreen extends StatelessWidget {
  final String taskId;
  const TaskDetailsScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is! TasksLoaded) {
            return const Center(child: CircularProgressIndicator());
          }
          final task = state.allTasks.firstWhere(
            (t) => t.id == taskId,
            orElse: () => Task(
              id: taskId, title: 'Task Not Found', type: TaskType.task,
              time: 'Unknown', isCompleted: false, isOverdue: false,
              priority: TaskPriority.low,
            ),
          );
          return Column(
            children: [
              const ScreenHeader(
                title: 'Task Details',
                showBackButton: true,
                padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TaskDetailsBody(task: task),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
