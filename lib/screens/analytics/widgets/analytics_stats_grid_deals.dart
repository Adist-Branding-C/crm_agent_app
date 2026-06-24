import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../utils/currency_formatter.dart';
import '../../../utils/responsive_helper.dart';
import 'analytics_stats_card.dart';
import '../../../theme.dart';

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
              AppSpacing.gapWLg,
              Expanded(child: cards[1]),
              AppSpacing.gapWLg,
              Expanded(child: cards[2]),
              AppSpacing.gapWLg,
              Expanded(child: cards[3]),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Expanded(child: cards[0]),
                  AppSpacing.gapWLg,
                  Expanded(child: cards[1]),
                ],
              ),
              AppSpacing.gapLg,
              Row(
                children: [
                  Expanded(child: cards[2]),
                  AppSpacing.gapWLg,
                  Expanded(child: cards[3]),
                ],
              ),
            ],
          );
  }
}
