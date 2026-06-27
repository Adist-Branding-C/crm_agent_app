import 'package:flutter/material.dart';
import '../../../theme.dart';

/// An individual menu item displaying an icon and text badge inside [FabMenu].
class FabMenuItem extends StatelessWidget {
  /// The text label.
  final String text;

  /// The icon vector.
  final IconData icon;

  /// The color of the icon.
  final Color color;

  /// Trigger callback on tap.
  final VoidCallback onTap;

  /// Creates a [FabMenuItem].
  const FabMenuItem({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
                fontSize: 12.s
              ),
            ),
          ),
          AppSpacing.gapWSm,
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Icon(icon, color: color, size: 20.s),
          ),
        ],
      ),
    );
  }
}
