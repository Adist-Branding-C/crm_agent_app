import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../utils/responsive_helper.dart';
import 'analytics_stats_card.dart';
import '../../../theme.dart';

class AnalyticsStatsGridLeads extends StatelessWidget {
  final LeadsSummary summary;

  const AnalyticsStatsGridLeads({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final cards = [
      AnalyticsStatsCard(
        icon: Icons.people_outline_rounded,
        iconColor: AppColors.errorColor,
        iconBgColor: AppColors.primaryColorLight,
        value: summary.totalLeads.toString(),
        label: 'Total leads',
      ),
      AnalyticsStatsCard(
        icon: Icons.adjust_rounded,
        iconColor: AppColors.accent,
        iconBgColor: AppColors.accentBackground,
        value: '${summary.conversionRate.toInt()}%',
        label: 'Conversion',
      ),
      AnalyticsStatsCard(
        icon: Icons.gesture_rounded,
        iconColor: AppColors.success,
        iconBgColor: AppColors.successBackground,
        value: summary.interestedCount.toString(),
        label: 'Interested',
      ),
      AnalyticsStatsCard(
        icon: Icons.trending_down_rounded,
        iconColor: AppColors.errorColor,
        iconBgColor: AppColors.errorBackground,
        value: summary.lostCount.toString(),
        label: 'Lost',
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
