import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../theme.dart';
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
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Column(
            children: List.generate(metrics.length, (index) {
              final item = metrics[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == metrics.length - 1 ? 0 : 16,
                ),
                child: MetricProgressRow(
                  title: item.status,
                  count: item.count.toString(),
                  progressValue: item.count / maxCount,
                  barColor: _getBarColor(item.status),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Color _getBarColor(String status) {
    switch (status) {
      case 'New':
        return const Color(0xFF3B82F6); // blue
      case 'Interested':
        return const Color(0xFF10B981); // green/teal
      case 'Qualified':
        return const Color(0xFF8B5CF6); // purple
      case 'Follow Up':
        return const Color(0xFFF59E0B); // orange
      case 'Lost':
      default:
        return const Color(0xFFEF4444); // red
    }
  }
}
