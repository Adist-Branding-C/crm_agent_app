import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'analytics_header.dart';

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
    return GestureDetector(
      onTap: () {
        openAnalyticsFilter(context: context);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(
              Icons.calendar_today_outlined,
              size: 11.s,
              color: AppColors.errorColor,
            ),
            AppSpacing.gapWSm,
            Text(
              selectedPeriod,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontSize: 13.s,
                fontWeight: FontWeight.bold,
              ),
            ),
             AppSpacing.gapSm,
             Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 14.s,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
