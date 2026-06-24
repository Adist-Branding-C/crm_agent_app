import 'package:flutter/material.dart';
import '../theme.dart';
import 'dashboard_shimmer_header.dart';
import 'dashboard_shimmer_stats_grid.dart';
import 'dashboard_shimmer_list_section.dart';

/// Full-screen skeleton shimmer loader for the Dashboard.
class DashboardShimmer extends StatelessWidget {
  /// Creates a constant [DashboardShimmer].
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardShimmerHeader(),
          AppSpacing.gapXxl,
          DashboardShimmerStatsGrid(),
          AppSpacing.gapXxl,
          DashboardShimmerListSection(),
          AppSpacing.gapXxl,
          DashboardShimmerListSection(),
        ],
      ),
    );
  }
}
