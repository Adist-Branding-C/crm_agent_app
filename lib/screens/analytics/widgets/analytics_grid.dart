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
                iconColor: const Color(0xFFEF4444),
                iconBgColor: const Color(0xFFFEE2E2),
                value: summary.totalLeads.toString(),
                label: 'Total leads',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.adjust_rounded,
                iconColor: const Color(0xFF8B5CF6),
                iconBgColor: const Color(0xFFF5F3FF),
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
                iconColor: const Color(0xFF10B981),
                iconBgColor: const Color(0xFFECFDF5),
                value: summary.wonDeals.toString(),
                label: 'Won deals',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AnalyticsStatsCard(
                icon: Icons.attach_money_rounded,
                iconColor: const Color(0xFFF59E0B),
                iconBgColor: const Color(0xFFFFFBEB),
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
