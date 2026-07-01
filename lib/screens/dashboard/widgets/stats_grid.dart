import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import 'stats_card.dart';
import 'horizontal_stats_row.dart';
import 'vertical_stats_grid.dart';

class StatsGrid extends StatelessWidget {
  final DashboardStats stats;

  const StatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveHelper.isTablet(context);
    final cards = [
      StatsCard(
        icon: Icons.campaign_outlined,
        iconColor: AppColors.accent,
        iconBgColor: AppColors.accentBackground,
        title: 'Campaign',
        subtitle: '${stats.activeCampaigns} active',
        onTap: () => context.pushNamed(AppRoutes.campaigns),
      ),
      StatsCard(
        icon: Icons.business_center_outlined,
        iconColor: AppColors.warning,
        iconBgColor: AppColors.warningBackground,
        title: 'Deals',
        subtitle: '${stats.openDeals} open',
        onTap: () => context.pushNamed(AppRoutes.deals),
      ),
      StatsCard(
        icon: Icons.donut_large_rounded,
        iconColor: AppColors.info,
        iconBgColor: AppColors.infoBackground,
        title: 'Analytics',
        subtitle: '${stats.analyticsConversionRate.toInt()}% conv.',
        onTap: () => context.pushNamed(AppRoutes.analytics),
      ),
      StatsCard(
        icon: Icons.fingerprint_rounded,
        iconColor: AppColors.success,
        iconBgColor: AppColors.successBackground,
        title: 'Attendance',
        subtitle: stats.attendanceStatus,
        onTap: () => context.pushNamed(AppRoutes.attendance),
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: isTablet
          ? HorizontalStatsRow(cards: cards)
          : VerticalStatsGrid(cards: cards),
    );
  }
}
