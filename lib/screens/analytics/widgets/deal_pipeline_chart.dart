import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import 'bar_chart_card.dart';
import 'deals_tab_helpers.dart';

class DealPipelineChart extends StatelessWidget {
  final List<PipelineValueStageMetric> pipelineMetrics;

  const DealPipelineChart({super.key, required this.pipelineMetrics});

  @override
  Widget build(BuildContext context) {
    final maxPipeline = maxPipelineValue(pipelineMetrics);
    final rows = buildPipelineRows(pipelineMetrics, maxPipeline);
    return BarChartCard(title: 'Pipeline value by stage', progressRows: rows);
  }
}
