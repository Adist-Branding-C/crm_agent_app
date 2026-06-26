import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterActionButtons extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const FilterActionButtons({
    super.key,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.h,
          width: 90.w,
          decoration: BoxDecoration(
          
            border: Border.all(color: AppColors.textMuted),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: GestureDetector(
            onTap: onReset,
            child: Center(
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.s,
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 55.h,
          width: 220.w,
          child: ElevatedButton(
            onPressed: onApply,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              'Apply Filters',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 15.s,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
