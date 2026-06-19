import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/donut_chart.dart';
import '../../../widgets/donut_segment.dart';
import '../models/lead_status_item.dart';
import 'lead_status_legend.dart';

/// Card showing "Lead Status Breakdown" title, donut chart, and legend.
class LeadStatusBreakdownCard extends StatelessWidget {
  final List<LeadStatusItem> items;
  final int totalLeads;

  const LeadStatusBreakdownCard({
    super.key,
    required this.items,
    required this.totalLeads,
  });

  List<DonutSegment> get _segments => items
      .map((e) => DonutSegment(value: e.count.toDouble(), color: e.color))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lead Status Breakdown',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: DonutChart(
              segments: _segments,
              centerLabel: '$totalLeads',
              centerSubLabel: 'leads',
            ),
          ),
          const SizedBox(height: 24),
          LeadStatusLegend(items: items),
        ],
      ),
    );
  }
}
