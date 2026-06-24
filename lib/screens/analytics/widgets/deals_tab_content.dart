import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import 'analytics_stats_grid_deals.dart';
import 'deal_stage_donut.dart';
import 'deal_pipeline_chart.dart';
import 'deal_type_chart.dart';
import '../../../theme.dart';

class DealsTabContent extends StatelessWidget {
  final DealsSummary summary;
  final List<DealStageMetric> stageMetrics;
  final List<PipelineValueStageMetric> pipelineMetrics;
  final List<DealTypeMetric> typeMetrics;

  const DealsTabContent({
    super.key,
    required this.summary,
    required this.stageMetrics,
    required this.pipelineMetrics,
    required this.typeMetrics,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnalyticsStatsGridDeals(summary: summary),
        AppSpacing.gapXxl,
        DealStageDonut(stageMetrics: stageMetrics),
        AppSpacing.gapXxl,
        DealPipelineChart(pipelineMetrics: pipelineMetrics),
        AppSpacing.gapXxl,
        DealTypeChart(typeMetrics: typeMetrics),
      ],
    );
  }
}
