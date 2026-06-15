import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/tasks_header.dart';
import 'widgets/tasks_filter_tabs.dart';
import 'widgets/tasks_list_view.dart';

/// Screen listing all tasks with filtering and state management.
class TasksScreen extends StatelessWidget {
  /// Creates a constant [TasksScreen].
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(
        tasksRepository: context.read<TasksRepository>(),
      )..add(const LoadTasks()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: const Column(
          children: [
            TasksHeader(),
            SizedBox(height: 12),
            TasksFilterTabs(),
            SizedBox(height: 16),
            Expanded(child: TasksListView()),
          ],
        ),
      ),
    );
  }
}
