import 'package:flutter/material.dart';
import '../models/lead_status_item.dart';
import 'lead_status_legend_item.dart';

/// A row-based legend grid for lead status segments.
class LeadStatusLegend extends StatelessWidget {
  final List<LeadStatusItem> items;

  const LeadStatusLegend({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 28,
      runSpacing: 16,
      children: items
          .map((item) => LeadStatusLegendItem(item: item))
          .toList(),
    );
  }
}
