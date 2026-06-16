import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../router/app_routes.dart';
import 'stats_card.dart';

/// Renders a 2x2 grid containing the stats metric cards.
class StatsGrid extends StatelessWidget {
  final DashboardStats stats;

  /// Creates a constant [StatsGrid].
  const StatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  icon: Icons.campaign_outlined,
                  iconColor: AppColors.accent,
                  iconBgColor: AppColors.accentBackground,
                  title: 'Campaign',
                  subtitle: '${stats.activeCampaigns} active',
                  onTap: () => context.pushNamed(AppRoutes.campaigns),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  icon: Icons.business_center_outlined,
                  iconColor: AppColors.warning,
                  iconBgColor: AppColors.warningBackground,
                  title: 'Deals',
                  subtitle: '${stats.openDeals} open',
                  onTap: () => context.pushNamed(AppRoutes.deals),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  icon: Icons.donut_large_rounded,
                  iconColor: AppColors.info,
                  iconBgColor: AppColors.infoBackground,
                  title: 'Analytics',
                  subtitle: '${stats.analyticsConversionRate.toInt()}% conv.',
                  onTap: () => context.pushNamed(AppRoutes.analytics),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  icon: Icons.fingerprint_rounded,
                  iconColor: AppColors.success,
                  iconBgColor: AppColors.successBackground,
                  title: 'Attendance',
                  subtitle: stats.attendanceStatus,
                  onTap: () => context.pushNamed(AppRoutes.attendance),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
