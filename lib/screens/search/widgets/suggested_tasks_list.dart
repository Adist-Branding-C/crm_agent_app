import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../tasks/widgets/task_card.dart';

/// Renders the list of suggested tasks resolved against the current tasks state.
class SuggestedTasksList extends StatelessWidget {
  final List<Task> tasks;

  const SuggestedTasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, tasksState) {
        final resolved = tasksState is TasksLoaded
            ? tasks.map((t) => tasksState.allTasks.firstWhere((item) => item.id == t.id, orElse: () => t)).toList()
            : tasks;
        return Column(
          children: resolved.map((t) => TaskCard(task: t)).toList(),
        );
      },
    );
  }
}
