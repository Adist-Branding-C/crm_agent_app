import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_filter_criteria.dart';
import '../../../theme.dart';
import 'tasks_filter_custom_date_inputs.dart';

/// Selection widget for Date Ranges inside the filter bottom sheet.
class TasksFilterDateSelector extends StatelessWidget {
  final DateRangeType selectedRange;
  final DateTime? customFrom;
  final DateTime? customTo;
  final ValueChanged<DateRangeType> onRangeChanged;
  final Function(DateTime?, DateTime?) onCustomDatesChanged;

  const TasksFilterDateSelector({
    super.key,
    required this.selectedRange,
    required this.customFrom,
    required this.customTo,
    required this.onRangeChanged,
    required this.onCustomDatesChanged,
  });

  @override
  Widget build(BuildContext context) {
    final active = selectedRange == DateRangeType.custom;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DATE RANGE',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: DateRangeType.values
              .where((r) => r != DateRangeType.none)
              .map((range) => _buildChip(range, selectedRange == range))
              .toList(),
        ),
        if (active) ...[
          const SizedBox(height: 16),
          TasksFilterCustomDateInputs(
            customFrom: customFrom,
            customTo: customTo,
            onCustomDatesChanged: onCustomDatesChanged,
          ),
        ],
      ],
    );
  }

  Widget _buildChip(DateRangeType range, bool isSel) {
    final color = isSel ? AppColors.warningText : AppColors.slate300;
    return GestureDetector(
      onTap: () => onRangeChanged(range),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSel ? AppColors.warningTextBackground : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: isSel ? 1.5 : 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (range == DateRangeType.custom) ...[
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: isSel ? AppColors.warningText : AppColors.textMuted,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              range.label,
              style: TextStyle(
                color: isSel ? AppColors.warningText : AppColors.textMuted,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
