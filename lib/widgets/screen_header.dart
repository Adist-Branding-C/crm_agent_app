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
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.xxl,
      vertical: AppSpacing.lg,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall;

    final sub =
        subtitleWidget ??
        (subtitle != null
            ? Text(
                subtitle!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              )
            : null);

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
            AppSpacing.gapWLg,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: titleStyle),
                if (sub != null) ...[AppSpacing.gapXxs, sub],
              ],
            ),
          ),
          if (actions != null) ...[AppSpacing.gapWLg, actions!],
        ],
      ),
    );
  }
}
