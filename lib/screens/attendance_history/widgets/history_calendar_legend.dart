import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Small visual grid explanation panel containing colored status dots.
class HistoryCalendarLegend extends StatelessWidget {
  /// Creates a constant [HistoryCalendarLegend].
  const HistoryCalendarLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.lg),
      child: Wrap(
        spacing: AppSpacing.md,
        runSpacing: AppSpacing.sm,
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

  const _LegendItem({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSpacing.sm,
          height: AppSpacing.sm,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        AppSpacing.gapWMd,
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
