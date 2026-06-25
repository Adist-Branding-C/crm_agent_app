import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/add_task_form.dart';

/// Screen page allowing users to add a new task, reusing [AddTaskForm].
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTaskBloc(tasksRepository: context.read<TasksRepository>()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            ScreenHeader(
              title: 'Add Task',
              showBackButton: true,
              padding: EdgeInsets.only(
                left: AppSpacing.xxl,
                right: AppSpacing.xxl,
                top: AppSpacing.lg,
                bottom: AppSpacing.sm,
              ),
            ),
            const Expanded(child: AddTaskForm()),
          ],
        ),
      ),
    );
  }
}
