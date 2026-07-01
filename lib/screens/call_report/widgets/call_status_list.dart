import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/donut_chart.dart';
import '../../../widgets/donut_segment.dart';
import '../models/call_status_item.dart';
import 'call_status_row.dart';

/// Card showing a Total Calls donut chart above a list of call status rows.
class CallStatusList extends StatelessWidget {
  final List<CallStatusItem> items;
  final int totalCalls;

  const CallStatusList({
    super.key,
    required this.items,
    required this.totalCalls,
  });

  List<DonutSegment> get _segments => items
      .map((e) => DonutSegment(value: e.count.toDouble(), color: e.color))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.xl),
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Call Status Breakdown',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          AppSpacing.gapXl,
          Center(
            child: DonutChart(
              segments: _segments,
              centerLabel: '$totalCalls',
              centerSubLabel: 'Total calls',
            ),
          ),
          AppSpacing.gapXl,
          ...items.map((item) => CallStatusRow(item: item)),
        ],
      ),
    );
  }
}
