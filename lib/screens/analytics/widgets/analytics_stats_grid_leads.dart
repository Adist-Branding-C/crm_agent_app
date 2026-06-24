import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/responsive_quad_grid.dart';
import 'analytics_stats_card.dart';
import '../../../theme.dart';

class AnalyticsStatsGridLeads extends StatelessWidget {
  final LeadsSummary summary;

  const AnalyticsStatsGridLeads({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return ResponsiveQuadGrid(
      children: [
        AnalyticsStatsCard(
          icon: Icons.people_outline_rounded, iconColor: AppColors.errorColor,
          iconBgColor: AppColors.primaryColorLight,
          value: summary.totalLeads.toString(), label: 'Total leads',
        ),
        AnalyticsStatsCard(
          icon: Icons.adjust_rounded, iconColor: AppColors.accent,
          iconBgColor: AppColors.accentBackground,
          value: '${summary.conversionRate.toInt()}%', label: 'Conversion',
        ),
        AnalyticsStatsCard(
          icon: Icons.gesture_rounded, iconColor: AppColors.success,
          iconBgColor: AppColors.successBackground,
          value: summary.interestedCount.toString(), label: 'Interested',
        ),
        AnalyticsStatsCard(
          icon: Icons.trending_down_rounded, iconColor: AppColors.errorColor,
          iconBgColor: AppColors.errorBackground,
          value: summary.lostCount.toString(), label: 'Lost',
        ),
      ],
    );
  }
}
