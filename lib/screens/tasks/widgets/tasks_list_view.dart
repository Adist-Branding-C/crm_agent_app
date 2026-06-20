import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/error_messages.dart';
import '../../../widgets/async_state_view.dart';
import 'task_card.dart';

/// Renders the list of tasks inside an async state wrapper.
class TasksListView extends StatelessWidget {
  /// Creates a constant [TasksListView].
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      buildWhen: (prev, curr) => prev != curr,
      builder: (context, state) {
        final tasks = state is TasksLoaded ? state.filteredTasks : const [];
        return AsyncStateView(
          isLoading: state is TasksLoading || state is TasksInitial,
          hasError: state is TasksError,
          errorMessage: state is TasksError ? state.failure.message : '',
          onRetry: () => context.read<TasksBloc>().add(const LoadTasks()),
          child: tasks.isEmpty
              ? const Center(
                  child: Text(
                    'No tasks found',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(task: tasks[index]);
                  },
                ),
        );
      },
    );
  }
}
