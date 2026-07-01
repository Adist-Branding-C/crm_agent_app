import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'custom_date_range_picker.dart';

class FilterDateRangeSection extends StatelessWidget {
  final String selectedPeriod;
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<String> onPeriodChanged;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;

  const FilterDateRangeSection({
    super.key,
    required this.selectedPeriod,
    this.startDate,
    this.endDate,
    required this.onPeriodChanged,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    const periods = [
      'Today',
      'This Week',
      'This Month',
      'This Quarter',
      'Custom range',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DATE RANGE',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5.w,
              ),
        ),
        AppSpacing.gapSm,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: periods.map((period) {
              final isSel = selectedPeriod == period;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: GestureDetector(
                  onTap: () => onPeriodChanged(period),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: isSel ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isSel
                          ? null
                          : Border.all(color: AppColors.borderLight),
                    ),
                    child: Text(
                      period,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isSel ? Colors.white : AppColors.textMuted,
                            fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        if (selectedPeriod == 'Custom range') ...[
          AppSpacing.gapXl,
          CustomDateRangePicker(
            startDate: startDate,
            endDate: endDate,
            onStartDateChanged: onStartDateChanged,
            onEndDateChanged: onEndDateChanged,
          ),
        ],
      ],
    );
  }
}
