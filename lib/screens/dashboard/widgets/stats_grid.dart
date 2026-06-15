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
                  iconColor: const Color(0xFF8B5CF6),
                  iconBgColor: const Color(0xFFF5F3FF),
                  title: 'Campaign',
                  subtitle: '${stats.activeCampaigns} active',
                  onTap: () => context.pushNamed(AppRoutes.campaigns),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  icon: Icons.business_center_outlined,
                  iconColor: const Color(0xFFF59E0B),
                  iconBgColor: const Color(0xFFFFFBEB),
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
                  iconColor: const Color(0xFF3B82F6),
                  iconBgColor: const Color(0xFFEFF6FF),
                  title: 'Analytics',
                  subtitle: '${stats.analyticsConversionRate.toInt()}% conv.',
                  onTap: () => context.pushNamed(AppRoutes.analytics),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  icon: Icons.fingerprint_rounded,
                  iconColor: const Color(0xFF10B981),
                  iconBgColor: const Color(0xFFECFDF5),
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
