import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme/app_colors.dart';
import 'metric_progress_row.dart';

class BarChartCard extends StatelessWidget {
  final String title;
  final List<MetricProgressRow> progressRows;

  const BarChartCard({
    super.key,
    required this.title,
    required this.progressRows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(progressRows.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == progressRows.length - 1 ? 0 : 16,
                ),
                child: progressRows[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
