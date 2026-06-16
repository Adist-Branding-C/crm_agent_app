import 'package:flutter/material.dart';
import '../theme.dart';
import 'count_badge.dart';
import 'section_header_action.dart';

part 'section_header_title.dart';

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
    super.key, required this.title, this.leadingIcon, this.leadingIconColor,
    this.countBadge, this.badgeBgColor, this.badgeTextColor, this.actionText,
    this.onActionTap, this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          _SectionHeaderTitle(
            title: title,
            leadingIcon: leadingIcon,
            leadingIconColor: leadingIconColor,
          ),
          if (countBadge != null) ...[
            const SizedBox(width: 8),
            CountBadge(
              count: countBadge!,
              bgColor: badgeBgColor,
              textColor: badgeTextColor,
            ),
          ],
          const Spacer(),
          if (actionText != null && onActionTap != null)
            SectionHeaderAction(
              actionText: actionText!,
              onActionTap: onActionTap!,
            ),
        ],
      ),
    );
  }
}
