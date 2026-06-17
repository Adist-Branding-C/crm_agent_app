import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'metric_progress_row.dart';

/// Renders the section title and card containing leads sorted by status.
class LeadsByStatusCard extends StatelessWidget {
  /// The list of status metrics.
  final List<StatusMetric> metrics;

  /// Creates a constant [LeadsByStatusCard].
  const LeadsByStatusCard({super.key, required this.metrics});

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
          'Leads by status',
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
                  title: item.status.label,
                  count: item.count.toString(),
                  progressValue: item.count / maxCount,
                  barColor: item.status.barColor,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
