import 'package:flutter/material.dart';
import '../../../theme.dart';

/// A button representing a profile action (like Call or Email).
class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color textColor;
  final Color bgColor;

  /// Creates a [ProfileActionButton].
  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.ten,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 15.s),
          AppSpacing.gapWSm,
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.s,
            ),
          ),
        ],
      ),
    );
  }
}
