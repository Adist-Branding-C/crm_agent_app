import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../../../theme.dart';
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
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading || state is DashboardInitial) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
        if (state is DashboardLoaded) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const DashboardHeader(),
                StatsGrid(stats: state.stats),
                FollowUpsList(calls: state.followUps),
                TasksList(tasks: state.tasks),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        final msg = state is DashboardError ? state.errorMessage : 'Error';
        return Center(
          child: Text(msg, style: const TextStyle(color: AppColors.errorColor)),
        );
      },
    );
  }
}
