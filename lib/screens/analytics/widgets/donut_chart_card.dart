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
    final isMobileSmall = ResponsiveHelper.isMobileSmall(context);
    final chart = DonutChart(
      segments: segments,
      centerLabel: centerLabel,
      centerSubLabel: centerSubLabel,
      size: 130,
    );

    final content = isMobileSmall
        ? Column(
            children: [
              chart,
              AppSpacing.gapLg,
              ...legendItems,
            ],
          )
        : Row(
            children: [
              chart,
              AppSpacing.gapWXl,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: legendItems,
                ),
              ),
            ],
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold),
        ),
        AppSpacing.gapMd,
        CustomCard(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: content,
        ),
      ],
    );
  }
}
