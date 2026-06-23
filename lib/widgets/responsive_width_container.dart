import 'package:flutter/material.dart';

/// Wraps content in a horizontally centered container with a maximum width constraint.
class ResponsiveWidthContainer extends StatelessWidget {
  /// The widget to display inside the container.
  final Widget child;

  /// The maximum width allowed.
  final double maxWidth;

  /// Creates a [ResponsiveWidthContainer].
  const ResponsiveWidthContainer({
    super.key,
    required this.child,
    this.maxWidth = 600,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
