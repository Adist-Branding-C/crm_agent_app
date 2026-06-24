import 'package:flutter/material.dart';
import '../theme.dart';

/// A reusable scaffold wrapper that standardizes page layout.
class PageScaffold extends StatelessWidget {
  /// The main content of the page.
  final Widget child;

  /// Background color for the scaffold.
  final Color backgroundColor;

  /// Padding applied around [child].
  final EdgeInsetsGeometry padding;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Whether to wrap the body in a safe area.
  final bool safeArea;

  /// Creates a [PageScaffold].
  const PageScaffold({
    super.key,
    required this.child,
    this.backgroundColor = AppTheme.backgroundColor,
    this.padding = AppSpacing.screenPadding,
    this.floatingActionButton,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(padding: padding, child: child);

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: safeArea ? SafeArea(child: body) : body,
    );
  }
}
