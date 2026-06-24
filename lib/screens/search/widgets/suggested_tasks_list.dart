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
    final taskMap = context.select<TasksBloc, Map<String, Task>>(
      (b) => b.state is TasksLoaded
          ? {for (final t in (b.state as TasksLoaded).allTasks) t.id: t}
          : const {},
    );
    final resolved = tasks.map((t) => taskMap[t.id] ?? t).toList();
    return Column(children: resolved.map((t) => TaskCard(task: t)).toList());
  }
}
