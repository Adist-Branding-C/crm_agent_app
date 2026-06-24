import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import 'stats_card.dart';

class StatsGrid extends StatelessWidget {
  final DashboardStats stats;

  const StatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveHelper.isTablet(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: 8),
      child: isTablet ? _horizontalRow(context) : _verticalGrid(context),
    );
  }

  Widget _horizontalRow(BuildContext context) {
    return Row(children: _allCards(context).map((c) => Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Expanded(child: c),
    )).toList());
  }

  Widget _verticalGrid(BuildContext context) {
    final cards = _allCards(context);
    return Column(children: [
      Row(children: [Expanded(child: cards[0]), const SizedBox(width: 16), Expanded(child: cards[1])]),
      const SizedBox(height: 16),
      Row(children: [Expanded(child: cards[2]), const SizedBox(width: 16), Expanded(child: cards[3])]),
    ]);
  }

  List<StatsCard> _allCards(BuildContext context) => [
    StatsCard(icon: Icons.campaign_outlined, iconColor: AppColors.accent, iconBgColor: AppColors.accentBackground, title: 'Campaign', subtitle: '${stats.activeCampaigns} active', onTap: () => context.pushNamed(AppRoutes.campaigns)),
    StatsCard(icon: Icons.business_center_outlined, iconColor: AppColors.warning, iconBgColor: AppColors.warningBackground, title: 'Deals', subtitle: '${stats.openDeals} open', onTap: () => context.pushNamed(AppRoutes.deals)),
    StatsCard(icon: Icons.donut_large_rounded, iconColor: AppColors.info, iconBgColor: AppColors.infoBackground, title: 'Analytics', subtitle: '${stats.analyticsConversionRate.toInt()}% conv.', onTap: () => context.pushNamed(AppRoutes.analytics)),
    StatsCard(icon: Icons.fingerprint_rounded, iconColor: AppColors.success, iconBgColor: AppColors.successBackground, title: 'Attendance', subtitle: stats.attendanceStatus, onTap: () => context.pushNamed(AppRoutes.attendance)),
  ];
}
