import 'package:flutter/material.dart';
import 'analytics_header.dart';
import '../../../theme.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openAnalyticsFilter(context: context);
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_alt_outlined,
              size: 14.s,
              color: AppColors.surfaceWhite,
            ),
            AppSpacing.gapWSm,
            Text(
              'Filter',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.surfaceWhite,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
