import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import 'bar_chart_card.dart';
import 'metric_progress_row.dart';

class LeadSourceChart extends StatelessWidget {
  final List<SourceMetric> sourceMetrics;

  const LeadSourceChart({super.key, required this.sourceMetrics});

  @override
  Widget build(BuildContext context) {
    final maxSource = sourceMetrics.fold<int>(
      1,
      (max, e) => e.count > max ? e.count : max,
    );
    final rows = sourceMetrics
        .map(
          (e) => MetricProgressRow(
            title: e.source.label,
            count: e.count.toString(),
            progressValue: maxSource > 0 ? e.count / maxSource : 0.0,
            barColor: e.source.barColor,
          ),
        )
        .toList();
    return BarChartCard(title: 'Leads by source', progressRows: rows);
  }
}
