import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../theme.dart';

/// Renders the status and priority badges for a follow-up card using Wrap
/// to avoid horizontal overflows on smaller layouts.
class FollowUpCardBadges extends StatelessWidget {
  final FollowUpCall call;
  final Color tagBg;
  final Color tagText;

  const FollowUpCardBadges({
    super.key,
    required this.call,
    required this.tagBg,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.w,
      runSpacing: 4.h,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: tagBg,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            call.tag.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: tagText,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.s,
                ),
          ),
        ),
        if (call.isOverdue)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.errorBackground,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              'Overdue',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.errorColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.s,
                  ),
            ),
          ),
      ],
    );
  }
}
