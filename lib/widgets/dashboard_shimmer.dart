import 'package:flutter/material.dart';
import 'app_shimmer_widget.dart';

part 'dashboard_shimmer_header.dart';
part 'dashboard_shimmer_stats_grid.dart';
part 'dashboard_shimmer_list_section.dart';

/// Full-screen skeleton shimmer loader for the Dashboard.
class DashboardShimmer extends StatelessWidget {
  /// Creates a constant [DashboardShimmer].
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DashboardShimmerHeader(),
          SizedBox(height: 24),
          _DashboardShimmerStatsGrid(),
          SizedBox(height: 24),
          _DashboardShimmerListSection(),
          SizedBox(height: 24),
          _DashboardShimmerListSection(),
        ],
      ),
    );
  }
}
