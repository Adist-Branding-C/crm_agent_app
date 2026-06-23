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
        children: [
          _buildItem(context, 'Present', AppColors.success),
          _buildItem(context, 'Late', AppColors.warning),
          _buildItem(context, 'Half Day', AppColors.warningText),
          _buildItem(context, 'On Leave', AppColors.info),
          _buildItem(context, 'Holiday', AppColors.accent),
          _buildItem(context, 'Week Off', AppColors.slate400),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String label, Color color) {
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
