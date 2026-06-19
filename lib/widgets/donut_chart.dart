import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'donut_segment.dart';
import 'donut_chart_painter.dart';

/// A generic donut chart with a centered label and sub-label.
class DonutChart extends StatelessWidget {
  final List<DonutSegment> segments;
  final String centerLabel;
  final String centerSubLabel;
  final double size;

  const DonutChart({
    super.key,
    required this.segments,
    required this.centerLabel,
    required this.centerSubLabel,
    this.size = 160,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: DonutChartPainter(segments: segments),
          ),
          _CenterLabel(label: centerLabel, subLabel: centerSubLabel),
        ],
      ),
    );
  }
}

class _CenterLabel extends StatelessWidget {
  final String label;
  final String subLabel;

  const _CenterLabel({required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        Text(
          subLabel,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
