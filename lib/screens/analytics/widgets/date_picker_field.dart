import 'package:flutter/material.dart';
import '../../../utils/context_text_extension.dart';
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
            fontSize: 11.s
          ),
        ),
        AppSpacing.gapWSm,
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 55.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.borderLight),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateStr,
                  style: TextStyle(
                    color: dateStr == 'dd-mm-yyyy'
                        ? AppColors.textMuted
                        : AppColors.textDark,
                    fontSize: 12.s,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 Icon(
                  Icons.calendar_today_outlined,
                  size: 12.s,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
        AppSpacing.gapLg
      ],
    );
  }
}
