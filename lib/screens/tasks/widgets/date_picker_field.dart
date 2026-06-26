import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_text_field.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDatePicked;

  const DatePickerField({
    super.key,
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
          height: 55.h,
         
          hintText: 'dd-mm-yyyy',
          controller: TextEditingController(text: formatted),
          suffixIcon:  Icon(
            Icons.calendar_today_rounded,
            size: 15.s,
            color: AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
