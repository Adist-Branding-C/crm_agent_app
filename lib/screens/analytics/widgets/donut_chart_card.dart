import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/donut_chart.dart';
import '../../../widgets/donut_segment.dart';
import 'legend_row.dart';
import '../../../theme.dart';

class DonutChartCard extends StatelessWidget {
  final String title;
  final List<DonutSegment> segments;
  final String centerLabel;
  final String centerSubLabel;
  final List<LegendRow> legendItems;

  const DonutChartCard({
    super.key,
    required this.title,
    required this.segments,
    required this.centerLabel,
    required this.centerSubLabel,
    required this.legendItems,
  });

  @override
  Widget build(BuildContext context) {
    
    final chart = DonutChart(
      segments: segments,
      centerLabel: centerLabel,
      centerSubLabel: centerSubLabel,
      size: 140.w,
    );

    final content = Row(
      children: [
        chart,
        AppSpacing.gapWXl,
        Expanded(
          child: Column(mainAxisSize: MainAxisSize.min, children: legendItems),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 16.s,
          ),
        ),
        AppSpacing.gapMd,
        CustomCard(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.lg,
          ),
          child: content,
        ),
      ],
    );
  }
}
