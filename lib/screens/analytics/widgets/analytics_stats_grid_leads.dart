import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../theme/app_colors.dart';
import 'analytics_stats_card.dart';

class AnalyticsStatsGridLeads extends StatelessWidget {
  final LeadsSummary summary;

  const AnalyticsStatsGridLeads({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.people_outline_rounded,
                iconColor: AppColors.errorColor,
                iconBgColor: AppColors.primaryColorLight,
                value: summary.totalLeads.toString(),
                label: 'Total leads',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.adjust_rounded,
                iconColor: AppColors.accent,
                iconBgColor: AppColors.accentBackground,
                value: '${summary.conversionRate.toInt()}%',
                label: 'Conversion',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.gesture_rounded,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successBackground,
                value: summary.interestedCount.toString(),
                label: 'Interested',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.trending_down_rounded,
                iconColor: AppColors.errorColor,
                iconBgColor: AppColors.errorBackground,
                value: summary.lostCount.toString(),
                label: 'Lost',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
