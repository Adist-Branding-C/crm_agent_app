import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'metric_progress_row.dart';

/// Renders the section title and card containing leads sorted by source.
class LeadsBySourceCard extends StatelessWidget {
  /// The list of source metrics.
  final List<SourceMetric> metrics;

  /// Creates a constant [LeadsBySourceCard].
  const LeadsBySourceCard({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    final maxCount = metrics.fold<int>(
      1,
      (max, e) => e.count > max ? e.count : max,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leads by source',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(metrics.length, (index) {
              final item = metrics[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == metrics.length - 1 ? 0 : 16,
                ),
                child: MetricProgressRow(
                  title: item.source.label,
                  count: item.count.toString(),
                  progressValue: item.count / maxCount,
                  barColor: _getBarColor(item.source),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Color _getBarColor(LeadSource source) {
    switch (source) {
      case LeadSource.facebook:
        return AppColors.info; // blue
      case LeadSource.website:
        return AppColors.success; // green/teal
      case LeadSource.referral:
        return AppColors.accent; // purple
      case LeadSource.instagram:
      default:
        return AppColors.warning; // orange
    }
  }
}
