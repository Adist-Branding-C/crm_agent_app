import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import 'card_icon_button.dart';
import 'screen_header_title.dart';

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
    final resolvedPadding = EdgeInsets.fromLTRB(12.0.w, 25.0.h, 12.0.w, 13.0.h);

    final titleStyle = (Theme.of(context).textTheme.headlineSmall ?? const TextStyle()).copyWith(
      fontSize: large ? 20.s : 18.s,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.7.w,
      color: AppColors.textDark,
    );

    final sub = subtitleWidget ?? (subtitle != null
        ? Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12.s,
            ),
          )
        : null);

    return Padding(
      padding: resolvedPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackButton) ...[
            CardIconButton(
              icon: Icons.chevron_left_rounded,
              size: 26.s,
              onTap: () => context.pop(),
            ),
            AppSpacing.gapWMd,
          ],
          Expanded(
            child: ScreenHeaderTitle(
              title: title,
              sub: sub,
              titleStyle: titleStyle,
            ),
          ),
          if (actions != null) ...[AppSpacing.gapWLg, actions!],
        ],
      ),
    );
  }
}
