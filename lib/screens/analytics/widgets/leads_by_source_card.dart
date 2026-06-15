import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../theme.dart';
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
                  title: item.source,
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

  Color _getBarColor(String source) {
    switch (source) {
      case 'Facebook':
        return const Color(0xFF3B82F6); // blue
      case 'Website':
        return const Color(0xFF10B981); // green/teal
      case 'Referral':
        return const Color(0xFF8B5CF6); // purple
      case 'Instagram':
      default:
        return const Color(0xFFF59E0B); // orange
    }
  }
}
