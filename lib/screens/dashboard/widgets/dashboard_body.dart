import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/dashboard_shimmer.dart';
import 'dashboard_header.dart';
import 'stats_grid.dart';
import 'follow_ups_list.dart';
import 'pending_tasks_section.dart';

String _dashboardErrorString(DashboardFailure f) {
  switch (f) {
    case DashboardFailure.load: return 'Failed to fetch dashboard data';
    case DashboardFailure.unknown: return 'An error occurred';
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
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
                const PendingTasksSection(),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        final msg = state is DashboardError ? _dashboardErrorString(state.failure) : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () =>
              context.read<DashboardBloc>().add(const FetchDashboardData()),
        );
      },
    );
  }
}
