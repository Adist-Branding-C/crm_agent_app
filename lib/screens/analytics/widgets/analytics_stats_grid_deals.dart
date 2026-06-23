import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/currency_formatter.dart';
import '../../../utils/responsive_helper.dart';
import 'analytics_stats_card.dart';

class AnalyticsStatsGridDeals extends StatelessWidget {
  final DealsSummary summary;

  const AnalyticsStatsGridDeals({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final cards = [
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
    ];

    final isTablet = ResponsiveHelper.isTablet(context);
    return isTablet
        ? Row(
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 16),
              Expanded(child: cards[1]),
              const SizedBox(width: 16),
              Expanded(child: cards[2]),
              const SizedBox(width: 16),
              Expanded(child: cards[3]),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Expanded(child: cards[0]),
                  const SizedBox(width: 16),
                  Expanded(child: cards[1]),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: cards[2]),
                  const SizedBox(width: 16),
                  Expanded(child: cards[3]),
                ],
              ),
            ],
          );
  }
}
