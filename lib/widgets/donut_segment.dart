import 'package:flutter/material.dart';

/// A single segment value and its color for use in a [DonutChart].
class DonutSegment {
  final double value;
  final Color color;

  const DonutSegment({required this.value, required this.color});
}
