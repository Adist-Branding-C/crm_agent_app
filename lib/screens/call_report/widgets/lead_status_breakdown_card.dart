import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
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
      padding: EdgeInsets.all(AppSpacing.xl),
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lead Status Breakdown',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          AppSpacing.gapXl,
          Center(
            child: DonutChart(
              segments: _segments,
              centerLabel: '$totalLeads',
              centerSubLabel: 'leads',
            ),
          ),
          AppSpacing.gapXxl,
          LeadStatusLegend(items: items),
        ],
      ),
    );
  }
}
