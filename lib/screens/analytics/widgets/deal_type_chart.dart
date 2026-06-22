import 'package:flutter/material.dart';
import '../../../bloc/analytics/deal_analytics_models.dart';
import 'bar_chart_card.dart';
import 'deals_tab_helpers.dart';

class DealTypeChart extends StatelessWidget {
  final List<DealTypeMetric> typeMetrics;

  const DealTypeChart({super.key, required this.typeMetrics});

  @override
  Widget build(BuildContext context) {
    final maxType = maxTypeValue(typeMetrics);
    final rows = buildTypeRows(typeMetrics, maxType);
    return BarChartCard(title: 'Value by deal type', progressRows: rows);
  }
}
