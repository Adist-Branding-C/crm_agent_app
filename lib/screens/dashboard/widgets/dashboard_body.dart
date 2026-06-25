import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import '../../error_messages.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/dashboard_shimmer.dart';
import 'dashboard_header.dart';
import 'stats_grid.dart';
import 'follow_ups_list.dart';
import 'pending_tasks_section.dart';

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
          final lists = ResponsiveHelper.isTablet(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: FollowUpsList(calls: state.followUps)),
                    AppSpacing.gapWLg,
                    const Expanded(child: PendingTasksSection()),
                  ],
                )
              : Column(
                  children: [
                    FollowUpsList(calls: state.followUps),
                    const PendingTasksSection(),
                  ],
                );

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const DashboardHeader(),
                StatsGrid(stats: state.stats),
                lists,
                 SizedBox(height: AppSpacing.xxl),
              ],
            ),
          );
        }
        final msg = state is DashboardError ? state.failure.message : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () =>
              context.read<DashboardBloc>().add(const FetchDashboardData()),
        );
      },
    );
  }
}
