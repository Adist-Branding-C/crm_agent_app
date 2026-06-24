import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../utils/currency_formatter.dart';
import '../../../widgets/responsive_quad_grid.dart';
import 'analytics_stats_card.dart';
import '../../../theme.dart';

class AnalyticsStatsGridDeals extends StatelessWidget {
  final DealsSummary summary;

  const AnalyticsStatsGridDeals({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return ResponsiveQuadGrid(
      children: [
        AnalyticsStatsCard(
          icon: Icons.business_center_outlined,
          iconColor: AppColors.warningText,
          iconBgColor: AppColors.warningTextBackground,
          value: summary.openPipelineAmount.toRupeeFormat(),
          label: 'Open pipeline',
        ),
        AnalyticsStatsCard(
          icon: Icons.check_rounded,
          iconColor: AppColors.success,
          iconBgColor: AppColors.successBackground,
          value: summary.wonDealsCount.toString(),
          label: 'Won deals',
        ),
        AnalyticsStatsCard(
          icon: Icons.adjust_rounded,
          iconColor: AppColors.accent,
          iconBgColor: AppColors.accentBackground,
          value: '${summary.winRate.toInt()}%',
          label: 'Win rate',
        ),
        AnalyticsStatsCard(
          icon: Icons.currency_rupee_rounded,
          iconColor: AppColors.info,
          iconBgColor: AppColors.infoBackground,
          value: summary.avgDealAmount.toRupeeFormat(),
          label: 'Avg deal',
        ),
      ],
    );
  }
}
