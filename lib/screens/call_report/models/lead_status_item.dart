import 'package:flutter/material.dart';

/// Immutable data model for a single lead status segment and legend entry.
class LeadStatusItem {
  final String label;
  final int count;
  final Color color;

  const LeadStatusItem({
    required this.label,
    required this.count,
    required this.color,
  });
}
