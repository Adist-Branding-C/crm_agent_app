import 'package:flutter/material.dart';
import '../theme.dart';

/// Reusable section title bar featuring optional count indicators, leading icons, and actions.
class SectionHeader extends StatelessWidget {
  /// Primary section header.
  final String title;

  /// Optional leading icon vector.
  final IconData? leadingIcon;

  /// Leading icon visual color.
  final Color? leadingIconColor;

  /// Optional numeric count badge indicator.
  final int? countBadge;

  /// Background color of the count badge.
  final Color? badgeBgColor;

  /// Text color of the count badge.
  final Color? badgeTextColor;

  /// Label for trailing action text link.
  final String? actionText;

  /// Trigger callback on action text press.
  final VoidCallback? onActionTap;

  /// Outer padding layout.
  final EdgeInsetsGeometry padding;

  /// Creates a [SectionHeader].
  const SectionHeader({
    super.key,
    required this.title,
    this.leadingIcon,
    this.leadingIconColor,
    this.countBadge,
    this.badgeBgColor,
    this.badgeTextColor,
    this.actionText,
    this.onActionTap,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, color: leadingIconColor ?? AppColors.textDark, size: 16),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColors.textDark,
            ),
          ),
          if (countBadge != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: badgeBgColor ?? const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$countBadge',
                style: TextStyle(
                  color: badgeTextColor ?? AppColors.textMuted,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
          const Spacer(),
          if (actionText != null && onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
