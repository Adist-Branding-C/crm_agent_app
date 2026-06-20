import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/donut_segment.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import 'analytics_stats_grid_leads.dart';
import 'donut_chart_card.dart';
import 'bar_chart_card.dart';
import 'legend_row.dart';
import 'metric_progress_row.dart';

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
    final maxSource = sourceMetrics.fold<int>(1, (max, e) => e.count > max ? e.count : max);

    final statusSegments = statusMetrics
        .map((e) => DonutSegment(value: e.count.toDouble(), color: e.status.barColor))
        .toList();

    final statusLegends = statusMetrics
        .map((e) => LegendRow(label: e.status.label, count: e.count, color: e.status.barColor))
        .toList();

    final sourceRows = sourceMetrics
        .map((e) => MetricProgressRow(
              title: e.source.label,
              count: e.count.toString(),
              progressValue: maxSource > 0 ? e.count / maxSource : 0.0,
              barColor: e.source.barColor,
            ))
        .toList();

    return Column(
      children: [
        AnalyticsStatsGridLeads(summary: summary),
        const SizedBox(height: 24),
        DonutChartCard(
          title: 'Leads by status',
          segments: statusSegments,
          centerLabel: summary.totalLeads.toString(),
          centerSubLabel: 'leads',
          legendItems: statusLegends,
        ),
        const SizedBox(height: 24),
        BarChartCard(
          title: 'Leads by source',
          progressRows: sourceRows,
        ),
      ],
    );
  }
}
