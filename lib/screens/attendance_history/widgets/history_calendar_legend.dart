import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Small visual grid explanation panel containing colored status dots.
class HistoryCalendarLegend extends StatelessWidget {
  /// Creates a constant [HistoryCalendarLegend].
  const HistoryCalendarLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: const [
          _LegendItem(label: 'Present', color: AppColors.success),
          _LegendItem(label: 'Late', color: AppColors.warning),
          _LegendItem(label: 'Half Day', color: AppColors.warningText),
          _LegendItem(label: 'On Leave', color: AppColors.info),
          _LegendItem(label: 'Holiday', color: AppColors.accent),
          _LegendItem(label: 'Week Off', color: AppColors.slate400),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String label;
  final Color color;

  const _LegendItem({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }
}
