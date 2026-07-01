import 'package:flutter/material.dart';
import '../theme.dart';

/// Renders the title and subtitle column block for screen headers.
class ScreenHeaderTitle extends StatelessWidget {
  /// Header title text.
  final String title;

  /// Header subtitle widget.
  final Widget? sub;

  /// Custom text style for the title.
  final TextStyle titleStyle;

  /// Creates a constant [ScreenHeaderTitle].
  const ScreenHeaderTitle({
    super.key,
    required this.title,
    this.sub,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: titleStyle),
        if (sub != null) ...[AppSpacing.gapXxs, sub!],
      ],
    );
  }
}
