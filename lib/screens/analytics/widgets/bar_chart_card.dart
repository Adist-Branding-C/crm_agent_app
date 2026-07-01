import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import 'metric_progress_row.dart';
import '../../../theme.dart';

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
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
        ),
        AppSpacing.gapMd,
        CustomCard(
          padding: EdgeInsets.all(AppSpacing.xl),
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
