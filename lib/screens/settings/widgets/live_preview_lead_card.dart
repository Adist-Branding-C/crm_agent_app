import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'hot_tag_badge.dart';

/// Small mockup lead card used for settings screen font previews.
class LivePreviewLeadCard extends StatelessWidget {
  /// Creates a constant [LivePreviewLeadCard].
  const LivePreviewLeadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
      decoration: BoxDecoration(
        color: AppColors.settingsCardBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: const BoxDecoration(
              color: AppColors.settingsRedLight,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              'PM',
              style: TextStyle(
                color: AppColors.settingsRed,
                fontWeight: FontWeight.bold,
                fontSize: 13.s,
              ),
            ),
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Priya Menon',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.s,
                  ),
                ),
                AppSpacing.gapXxs,
                Text(
                  'Premium Course · Calicut',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 11.s,
                  ),
                ),
              ],
            ),
          ),
          const HotTagBadge(),
        ],
      ),
    );
  }
}
