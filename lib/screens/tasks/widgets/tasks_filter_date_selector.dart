import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_filter_criteria.dart';
import '../../../theme/app_colors.dart';
import 'filter_date_chip.dart';
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
              .map((range) => FilterDateChip(
                range: range,
                isSelected: selectedRange == range,
                onTap: () => onRangeChanged(range),
              ))
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
}
