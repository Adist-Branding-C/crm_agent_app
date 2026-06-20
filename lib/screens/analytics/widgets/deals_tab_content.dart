import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../widgets/donut_segment.dart';
import '../../deals/widgets/deals_presentation_extensions.dart';
import '../../../utils/currency_formatter.dart';
import '../../../theme/app_colors.dart';
import 'analytics_stats_grid_deals.dart';
import 'donut_chart_card.dart';
import 'bar_chart_card.dart';
import 'legend_row.dart';
import 'metric_progress_row.dart';

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
    final totalDeals = stageMetrics.fold<int>(0, (sum, e) => sum + e.count);
    final maxPipeline = pipelineMetrics.fold<double>(1.0, (max, e) => e.amount > max ? e.amount : max);
    final maxType = typeMetrics.fold<double>(1.0, (max, e) => e.amount > max ? e.amount : max);

    final stageSegments = stageMetrics
        .map((e) => DonutSegment(value: e.count.toDouble(), color: e.stage.color))
        .toList();

    final stageLegends = stageMetrics
        .map((e) => LegendRow(label: e.stage.label, count: e.count, color: e.stage.color))
        .toList();

    final pipelineRows = pipelineMetrics
        .map((e) => MetricProgressRow(
              title: e.stage.label,
              count: e.amount.toRupeeFormat(),
              progressValue: maxPipeline > 0 ? e.amount / maxPipeline : 0.0,
              barColor: e.stage.color,
            ))
        .toList();

    final typeColors = [AppColors.info, AppColors.accent, AppColors.warning];
    final typeRows = List.generate(typeMetrics.length, (index) {
      final e = typeMetrics[index];
      return MetricProgressRow(
        title: e.dealType,
        count: e.amount.toRupeeFormat(),
        progressValue: maxType > 0 ? e.amount / maxType : 0.0,
        barColor: typeColors[index % typeColors.length],
      );
    });

    return Column(
      children: [
        AnalyticsStatsGridDeals(summary: summary),
        const SizedBox(height: 24),
        DonutChartCard(
          title: 'Deals by stage',
          segments: stageSegments,
          centerLabel: totalDeals.toString(),
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
