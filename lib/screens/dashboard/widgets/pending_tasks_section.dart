import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'tasks_list.dart';

class PendingTasksSection extends StatelessWidget {
  const PendingTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TasksBloc, TasksState, List<Task>>(
      selector: (state) => state is TasksLoaded
          ? state.allTasks.where((t) => !t.isCompleted).take(3).toList()
          : const [],
      builder: (_, tasks) => TasksList(tasks: tasks),
    );
  }
}
