import 'package:flutter/material.dart';
import '../theme.dart';

class LeadSourceCard extends StatelessWidget {
  final String count;
  final String sourrceName;

  const LeadSourceCard({
    super.key,
    required this.count,
    required this.sourrceName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sourrceName,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            fontSize: 15.s,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Container(
          width: 32.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor.withAlpha(80),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              count,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 17.s,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
