import 'package:flutter/material.dart';
import '../../../theme.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final String dateStr;
  final VoidCallback onTap;

  const DatePickerField({
    super.key,
    required this.label,
    required this.dateStr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.bold,
              ),
        ),
        AppSpacing.gapWSm,
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderLight),
              ),
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      dateStr,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: dateStr == 'dd-mm-yyyy'
                                ? AppColors.textMuted
                                : AppColors.textDark,
                            fontWeight: FontWeight.w500,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AppSpacing.gapWSm,
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 12.s,
                    color: AppColors.textMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
