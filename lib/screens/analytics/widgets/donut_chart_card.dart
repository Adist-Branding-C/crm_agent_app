import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/donut_chart.dart';
import '../../../widgets/donut_segment.dart';
import '../../../theme/app_colors.dart';
import 'legend_row.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              DonutChart(
                segments: segments,
                centerLabel: centerLabel,
                centerSubLabel: centerSubLabel,
                size: 130,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: legendItems,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
