import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'tasks_header_actions.dart';

/// Renders the composed top header of the Tasks page.
class TasksHeader extends StatelessWidget {
  /// Creates a constant [TasksHeader].
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      buildWhen: (prev, curr) {
        if (prev is TasksLoaded && curr is TasksLoaded) {
          return prev.pendingCount != curr.pendingCount ||
              prev.overdueCount != curr.overdueCount;
        }
        return prev.runtimeType != curr.runtimeType;
      },
      builder: (context, state) {
        int pending = 0;
        int overdue = 0;
        if (state is TasksLoaded) {
          pending = state.pendingCount;
          overdue = state.overdueCount;
        }

        return ScreenHeader(
          title: 'Tasks',
          subtitleWidget: Text(
            '$pending pending · $overdue overdue',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          showBackButton: false,
          actions: const TasksHeaderActions(),
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        );
      },
    );
  }
}
