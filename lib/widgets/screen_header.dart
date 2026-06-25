import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../utils/context_text_extension.dart';
import 'card_icon_button.dart';

/// Standardized header widget for screens featuring optional back-navigation.
class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final bool showBackButton;
  final Widget? actions;
  final EdgeInsetsGeometry? padding;
  final bool? isLarge;

  /// Creates a [ScreenHeader].
  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.showBackButton = true,
    this.actions,
    this.padding,
    this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    final large = isLarge ?? !showBackButton;
    final resolvedPadding = padding ?? EdgeInsets.fromLTRB(
      17.0,
      54.0,
      17.0,
      large ? 7.0 : 13.0,
    );

    final titleStyle = (Theme.of(context).textTheme.headlineSmall ?? const TextStyle()).copyWith(
      fontSize: context.scaleFont(large ? 27.0 : 18.0),
      fontWeight: FontWeight.bold,
      letterSpacing: large ? -0.55 : -0.2,
      color: AppColors.textDark,
    );

    final sub =
        subtitleWidget ??
        (subtitle != null
            ? Text(
                subtitle!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              )
            : null);

    return Padding(
      padding: resolvedPadding,
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
