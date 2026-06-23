import 'package:flutter/material.dart';
import 'date_picker_field.dart';

/// Row of date picker text fields displayed under Custom date range preset.
class TasksFilterCustomDateInputs extends StatelessWidget {
  final DateTime? customFrom;
  final DateTime? customTo;
  final Function(DateTime?, DateTime?) onCustomDatesChanged;

  const TasksFilterCustomDateInputs({
    super.key,
    required this.customFrom,
    required this.customTo,
    required this.onCustomDatesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePickerField(
            label: 'From',
            selectedDate: customFrom,
            onDatePicked: (date) => onCustomDatesChanged(date, customTo),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DatePickerField(
            label: 'To',
            selectedDate: customTo,
            onDatePicked: (date) => onCustomDatesChanged(customFrom, date),
          ),
        ),
      ],
    );
  }
}
