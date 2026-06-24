import 'package:flutter/material.dart';
import '../../../utils/context_text_extension.dart';
import '../../../theme.dart';
import 'date_picker_field.dart';

class FilterDateRangeSection extends StatelessWidget {
  final String selectedPeriod;
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<String> onPeriodChanged;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;

  const FilterDateRangeSection({super.key, required this.selectedPeriod, this.startDate, this.endDate,
    required this.onPeriodChanged, required this.onStartDateChanged, required this.onEndDateChanged});

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context, initialDate: DateTime.now(),
      firstDate: DateTime(2020), lastDate: DateTime(2030),
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
    const periods = ['Today', 'This Week', 'This Month', 'This Quarter', 'Custom range'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DATE RANGE', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        AppSpacing.gapSm,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: periods.map((period) {
              final isSel = selectedPeriod == period;
              return Padding(
                padding: EdgeInsets.only(right: AppSpacing.sm),
                child: GestureDetector(
                  onTap: () => onPeriodChanged(period),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: isSel ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: isSel ? null : Border.all(color: AppColors.borderLight),
                    ),
                    child: Text(period, style: TextStyle(color: isSel ? Colors.white : AppColors.textMuted, fontWeight: FontWeight.w600, fontSize: context.scaleFont(12))),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        if (selectedPeriod == 'Custom range') ...[
          AppSpacing.gapLg,
          Row(
            children: [
              Expanded(child: DatePickerField(label: 'From', dateStr: _formatDate(startDate), onTap: () => _selectDate(context, true))),
              AppSpacing.gapWLg,
              Expanded(child: DatePickerField(label: 'To', dateStr: _formatDate(endDate), onTap: () => _selectDate(context, false))),
            ],
          ),
        ],
      ],
    );
  }
}
