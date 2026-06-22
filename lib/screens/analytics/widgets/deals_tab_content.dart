import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../widgets/donut_segment.dart';
import '../../deals/widgets/deals_presentation_extensions.dart';
import 'analytics_stats_grid_deals.dart';
import 'donut_chart_card.dart';
import 'bar_chart_card.dart';
import 'legend_row.dart';
import 'deals_tab_helpers.dart';

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
    final total = totalDealCount(stageMetrics);
    final maxPipeline = maxPipelineValue(pipelineMetrics);
    final maxType = maxTypeValue(typeMetrics);

    final stageSegments = stageMetrics
        .map((e) => DonutSegment(value: e.count.toDouble(), color: e.stage.color))
        .toList();

    final stageLegends = stageMetrics
        .map((e) => LegendRow(label: e.stage.label, count: e.count, color: e.stage.color))
        .toList();

    final pipelineRows = buildPipelineRows(pipelineMetrics, maxPipeline);
    final typeRows = buildTypeRows(typeMetrics, maxType);

    return Column(
      children: [
        AnalyticsStatsGridDeals(summary: summary),
        const SizedBox(height: 24),
        DonutChartCard(
          title: 'Deals by stage',
          segments: stageSegments,
          centerLabel: total.toString(),
          centerSubLabel: 'deals',
          legendItems: stageLegends,
        ),
        const SizedBox(height: 24),
        BarChartCard(
          title: 'Pipeline value by stage',
          progressRows: pipelineRows,
        ),
        const SizedBox(height: 24),
        BarChartCard(
          title: 'Value by deal type',
          progressRows: typeRows,
        ),
      ],
    );
  }
}
