import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders the "Hot" lead priority status badge using settings colors.
class HotTagBadge extends StatelessWidget {
  /// Creates a constant [HotTagBadge].
  const HotTagBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
      decoration: BoxDecoration(
        color: AppColors.settingsRedLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bolt_rounded,
            size: 12.s,
            color: AppColors.settingsRed,
          ),
          AppSpacing.gapXxs,
          Text(
            'Hot',
            style: TextStyle(
              color: AppColors.settingsRed,
              fontWeight: FontWeight.bold,
              fontSize: 10.s,
            ),
          ),
        ],
      ),
    );
  }
}
