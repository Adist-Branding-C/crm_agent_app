import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
import 'add_deal_date_picker_helper.dart';

class AddDealDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const AddDealDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await AddDealDatePickerHelper.pickDateTime(context);
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = selectedDate != null
        ? AddDealDatePickerHelper.format(selectedDate!)
        : 'Select date & time';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expected close',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.slate600,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.gapXs,
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderLight),
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  displayText,
                  style: TextStyle(
                    color: selectedDate != null ? AppColors.textDark : AppColors.textMuted,
                    fontSize: context.scaleFont(14),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
