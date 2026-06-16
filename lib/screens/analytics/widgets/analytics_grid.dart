import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import 'analytics_stats_card.dart';

/// Renders a 2x2 grid of vertical metrics cards for the Analytics view.
class AnalyticsGrid extends StatelessWidget {
  /// The summary metrics to display.
  final AnalyticsSummary summary;

  /// Creates a constant [AnalyticsGrid].
  const AnalyticsGrid({super.key, required this.summary});

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
                icon: Icons.business_center_outlined,
                iconColor: AppColors.success,
                iconBgColor: AppColors.successBackground,
                value: summary.wonDeals.toString(),
                label: 'Won deals',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.attach_money_rounded,
                iconColor: AppColors.warning,
                iconBgColor: AppColors.warningBackground,
                value: summary.pipelineValue,
                label: 'Pipeline',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
