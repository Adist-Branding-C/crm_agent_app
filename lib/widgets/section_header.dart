import 'package:flutter/material.dart';
import '../theme.dart';
import 'count_badge.dart';
import 'section_header_action.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final int? countBadge;
  final Color? badgeBgColor;
  final Color? badgeTextColor;
  final String? actionText;
  final VoidCallback? onActionTap;
  final EdgeInsetsGeometry padding;

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
          _SectionHeaderTitle(title: title, leadingIcon: leadingIcon, leadingIconColor: leadingIconColor),
          if (countBadge != null) ...[
            const SizedBox(width: 8),
            CountBadge(count: countBadge!, bgColor: badgeBgColor, textColor: badgeTextColor),
          ],
          const Spacer(),
          if (actionText != null && onActionTap != null)
            SectionHeaderAction(actionText: actionText!, onActionTap: onActionTap!),
        ],
      ),
    );
  }
}

class _SectionHeaderTitle extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Color? leadingIconColor;

  const _SectionHeaderTitle({required this.title, this.leadingIcon, this.leadingIconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, color: leadingIconColor ?? AppColors.textDark, size: 16),
          const SizedBox(width: 8),
        ],
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.textDark,
              ),
        ),
      ],
    );
  }
}
