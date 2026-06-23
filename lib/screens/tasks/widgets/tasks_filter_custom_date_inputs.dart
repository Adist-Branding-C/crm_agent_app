import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_text_field.dart';

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
          child: _DatePickerField(
            label: 'From',
            selectedDate: customFrom,
            onDatePicked: (date) => onCustomDatesChanged(date, customTo),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _DatePickerField(
            label: 'To',
            selectedDate: customTo,
            onDatePicked: (date) => onCustomDatesChanged(customFrom, date),
          ),
        ),
      ],
    );
  }
}

class _DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDatePicked;

  const _DatePickerField({
    required this.label,
    required this.selectedDate,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = selectedDate == null
        ? 'dd-mm-yyyy'
        : '${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}';
    return GestureDetector(
      onTap: () async {
        final now = DateTime.now();
        final date = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: now.subtract(const Duration(days: 365 * 2)),
          lastDate: now.add(const Duration(days: 365 * 2)),
        );
        if (date != null) {
          onDatePicked(date);
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          label: label,
          hintText: 'dd-mm-yyyy',
          controller: TextEditingController(text: formatted),
          suffixIcon: const Icon(
            Icons.calendar_today_rounded,
            size: 18,
            color: AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
