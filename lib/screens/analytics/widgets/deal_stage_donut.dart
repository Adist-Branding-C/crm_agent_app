import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../widgets/donut_segment.dart';
import '../../deals/widgets/deals_presentation_extensions.dart';
import 'donut_chart_card.dart';
import 'legend_row.dart';
import 'deals_tab_helpers.dart';

class DealStageDonut extends StatelessWidget {
  final List<DealStageMetric> stageMetrics;

  const DealStageDonut({super.key, required this.stageMetrics});

  @override
  Widget build(BuildContext context) {
    final segments = stageMetrics
        .map(
          (e) => DonutSegment(value: e.count.toDouble(), color: e.stage.color),
        )
        .toList();
    final legends = stageMetrics
        .map(
          (e) => LegendRow(
            label: e.stage.label,
            count: e.count,
            color: e.stage.color,
          ),
        )
        .toList();
    return DonutChartCard(
      title: 'Deals by stage',
      segments: segments,
      centerLabel: totalDealCount(stageMetrics).toString(),
      centerSubLabel: 'deals',
      legendItems: legends,
    );
  }
}
