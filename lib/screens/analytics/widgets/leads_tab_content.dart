import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import 'analytics_stats_grid_leads.dart';
import 'lead_status_donut.dart';
import 'lead_source_chart.dart';
import '../../../theme.dart';

class LeadsTabContent extends StatelessWidget {
  final LeadsSummary summary;
  final List<StatusMetric> statusMetrics;
  final List<SourceMetric> sourceMetrics;

  const LeadsTabContent({
    super.key,
    required this.summary,
    required this.statusMetrics,
    required this.sourceMetrics,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnalyticsStatsGridLeads(summary: summary),
        AppSpacing.gapXxl,
        LeadStatusDonut(summary: summary, statusMetrics: statusMetrics),
        AppSpacing.gapXxl,
        LeadSourceChart(sourceMetrics: sourceMetrics),
      ],
    );
  }
}
