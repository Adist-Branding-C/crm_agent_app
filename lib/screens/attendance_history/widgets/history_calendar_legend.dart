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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItem('Present', AppColors.success),
              _buildItem('Late', AppColors.warning),
              _buildItem('Half Day', AppColors.warningText),
              _buildItem('On Leave', AppColors.info),
              _buildItem('Holiday', AppColors.accent),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildItem('Week Off', AppColors.slate400),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String label, Color color) {
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
          style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
        ),
      ],
    );
  }
}
