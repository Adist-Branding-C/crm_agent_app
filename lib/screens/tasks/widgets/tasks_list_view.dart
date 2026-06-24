import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../error_messages.dart';
import '../../../widgets/async_state_view.dart';
import 'task_card.dart';

/// Renders the list of tasks inside an async state wrapper.
class TasksListView extends StatelessWidget {
  /// Creates a constant [TasksListView].
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksBloc, TasksState>(
      listenWhen: (prev, curr) =>
          curr is TasksLoaded && curr.actionFailure != null,
      listener: (context, state) {
        if (state is TasksLoaded && state.actionFailure != null) {
          final msg = state.actionFailure == TasksFailure.toggle
              ? 'Failed to toggle task'
              : 'An error occurred';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
          context.read<TasksBloc>().add(const ClearActionFailure());
        }
      },
      child: BlocBuilder<TasksBloc, TasksState>(
        buildWhen: (prev, curr) => prev != curr,
        builder: (context, state) {
          final tasks = state is TasksLoaded
              ? state.getFilteredTasks(DateTime.now())
              : const [];
          return AsyncStateView(
            isLoading: state is TasksLoading || state is TasksInitial,
            hasError: state is TasksError,
            errorMessage: state is TasksError ? state.failure.message : '',
            onRetry: () => context.read<TasksBloc>().add(const LoadTasks()),
            child: tasks.isEmpty
                ? const Center(
                    child: Text(
                      'No tasks found',
                      style: TextStyle(color: AppColors.surfaceGrey),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.only(bottom: AppSpacing.xxl),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(task: tasks[index]);
                    },
                  ),
          );
        },
      ),
    );
  }
}
