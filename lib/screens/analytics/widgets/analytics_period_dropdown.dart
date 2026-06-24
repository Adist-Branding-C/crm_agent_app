import 'package:flutter/material.dart';
import '../../../theme.dart';

class AnalyticsPeriodDropdown extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onPeriodChanged;

  const AnalyticsPeriodDropdown({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: AppColors.errorColor,
            ),
            AppSpacing.gapWSm,
            Text(
              selectedPeriod,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpacing.gapWXs,
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
