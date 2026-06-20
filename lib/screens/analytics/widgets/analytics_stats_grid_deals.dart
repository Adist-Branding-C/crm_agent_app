import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/currency_formatter.dart';
import 'analytics_stats_card.dart';

class AnalyticsStatsGridDeals extends StatelessWidget {
  final DealsSummary summary;

  const AnalyticsStatsGridDeals({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.business_center_outlined,
                iconColor: AppColors.warningText,
                iconBgColor: AppColors.warningTextBackground,
                value: summary.openPipelineAmount.toRupeeFormat(),
                label: 'Open pipeline',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.check_rounded,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successBackground,
                value: summary.wonDealsCount.toString(),
                label: 'Won deals',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.adjust_rounded,
                iconColor: AppColors.accent,
                iconBgColor: AppColors.accentBackground,
                value: '${summary.winRate.toInt()}%',
                label: 'Win rate',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.currency_rupee_rounded,
                iconColor: AppColors.info,
                iconBgColor: AppColors.infoBackground,
                value: summary.avgDealAmount.toRupeeFormat(),
                label: 'Avg deal',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
