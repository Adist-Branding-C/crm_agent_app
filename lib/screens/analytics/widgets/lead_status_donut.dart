import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/donut_segment.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import 'donut_chart_card.dart';
import 'legend_row.dart';

class LeadStatusDonut extends StatelessWidget {
  final LeadsSummary summary;
  final List<StatusMetric> statusMetrics;

  const LeadStatusDonut({
    super.key,
    required this.summary,
    required this.statusMetrics,
  });

  @override
  Widget build(BuildContext context) {
    final segments = statusMetrics
        .map(
          (e) =>
              DonutSegment(value: e.count.toDouble(), color: e.status.barColor),
        )
        .toList();
    final legends = statusMetrics
        .map(
          (e) => LegendRow(
            label: e.status.label,
            count: e.count,
            color: e.status.barColor,
          ),
        )
        .toList();
    return DonutChartCard(
      title: 'Leads by status',
      segments: segments,
      centerLabel: summary.totalLeads.toString(),
      centerSubLabel: 'leads',
      legendItems: legends,
    );
  }
}
