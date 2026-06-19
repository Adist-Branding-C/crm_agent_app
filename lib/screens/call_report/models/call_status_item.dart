import 'package:flutter/material.dart';

/// Immutable data model for a single call status row in the report.
class CallStatusItem {
  final String label;
  final int count;
  final int percentage;
  final Color color;

  const CallStatusItem({
    required this.label,
    required this.count,
    required this.percentage,
    required this.color,
  });
}
