import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import 'card_icon_button.dart';

/// Standardized header widget for screens featuring optional back-navigation.
class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final bool showBackButton;
  final Widget? actions;
  final EdgeInsetsGeometry padding;

  /// Creates a [ScreenHeader].
  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.showBackButton = true,
    this.actions,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: showBackButton ? 20 : 28,
        );

    Widget? sub;
    if (subtitleWidget != null) {
      sub = subtitleWidget;
    } else if (subtitle != null) {
      sub = Text(
        subtitle!,
        style: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBackButton) ...[
            CardIconButton(
              icon: Icons.chevron_left_rounded,
              onTap: () => context.pop(),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: titleStyle),
                if (sub != null) ...[
                  const SizedBox(height: 2),
                  sub,
                ],
              ],
            ),
          ),
          if (actions != null) ...[
            const SizedBox(width: 16),
            actions!,
          ],
        ],
      ),
    );
  }
}
