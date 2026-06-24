import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'donut_segment.dart';

/// Paints a segmented donut ring using [CustomPainter].
class DonutChartPainter extends CustomPainter {
  final List<DonutSegment> segments;
  final double strokeWidth;

  const DonutChartPainter({required this.segments, this.strokeWidth = 22});

  @override
  void paint(Canvas canvas, Size size) {
    final total = segments.fold<double>(0, (s, e) => s + e.value);
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide / 2) - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -math.pi / 2;
    const gap = 0.03;

    for (final segment in segments) {
      final sweep = (segment.value / total) * 2 * math.pi - gap;
      paint.color = segment.color;
      canvas.drawArc(rect, startAngle, sweep, false, paint);
      startAngle += sweep + gap;
    }
  }

  @override
  bool shouldRepaint(DonutChartPainter old) =>
      old.segments != segments || old.strokeWidth != strokeWidth;
}
