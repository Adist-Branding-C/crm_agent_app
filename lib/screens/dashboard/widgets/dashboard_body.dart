import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/dashboard_shimmer.dart';
import 'dashboard_header.dart';
import 'stats_grid.dart';
import 'follow_ups_list.dart';
import 'tasks_list.dart';

/// Renders the scrollable body of the Dashboard screen.
class DashboardBody extends StatelessWidget {
  /// Creates a constant [DashboardBody].
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksState = context.watch<TasksBloc>().state;
    final pendingTasks = tasksState is TasksLoaded
        ? tasksState.allTasks.where((t) => !t.isCompleted).take(3).toList()
        : <Task>[];
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading || state is DashboardInitial) {
          return const DashboardShimmer();
        }
        if (state is DashboardLoaded) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const DashboardHeader(),
                StatsGrid(stats: state.stats),
                FollowUpsList(calls: state.followUps),
                TasksList(tasks: pendingTasks),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        final msg = state is DashboardError ? state.errorMessage : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () =>
              context.read<DashboardBloc>().add(const FetchDashboardData()),
        );
      },
    );
  }
}
