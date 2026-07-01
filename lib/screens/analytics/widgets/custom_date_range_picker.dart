import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'date_picker_field.dart';

class CustomDateRangePicker extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;

  const CustomDateRangePicker({
    super.key,
    this.startDate,
    this.endDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  });

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 50000)),
    );
    if (picked != null) {
      (isStart ? onStartDateChanged : onEndDateChanged)(picked);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'dd-mm-yyyy';
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePickerField(
            label: 'From :',
            dateStr: _formatDate(startDate),
            onTap: () => _selectDate(context, true),
          ),
        ),
        AppSpacing.gapWLg,
        Expanded(
          child: DatePickerField(
            label: 'To :',
            dateStr: _formatDate(endDate),
            onTap: () => _selectDate(context, false),
          ),
        ),
      ],
    );
  }
}
