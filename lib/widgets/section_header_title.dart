import 'package:flutter/material.dart';
import '../theme.dart';

/// Title widget with optional leading icon for section headers.
class SectionHeaderTitle extends StatelessWidget {
  /// Header title text.
  final String title;

  /// Optional leading icon.
  final IconData? leadingIcon;

  /// Optional color for the leading icon.
  final Color? leadingIconColor;

  /// Creates a constant [SectionHeaderTitle].
  const SectionHeaderTitle({
    super.key,
    required this.title,
    this.leadingIcon,
    this.leadingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leadingIcon != null) ...[
          Icon(
            leadingIcon,
            color: leadingIconColor ?? AppColors.textDark,
            size: 16.s,
          ),
          AppSpacing.gapWSm,
        ],
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
          ),
        ),
      ],
    );
  }
}
