import 'package:flutter/material.dart';
import 'app_error_widget.dart';
import 'app_loading_widget.dart';

/// Generic reusable widget for async screen state handling.
///
/// Displays a loading indicator, an error panel, or the provided content.
class AsyncStateView extends StatelessWidget {
  /// Whether the view should show a loading state.
  final bool isLoading;

  /// Whether the view should show an error state.
  final bool hasError;

  /// The error message displayed when [hasError] is true.
  final String errorMessage;

  /// Callback to retry the failed operation.
  final VoidCallback onRetry;

  /// The content shown when not loading or in error.
  final Widget child;

  /// Optional override for the loading widget.
  final Widget? loadingWidget;

  /// Creates an [AsyncStateView].
  const AsyncStateView({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
    required this.onRetry,
    required this.child,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ?? const AppLoadingWidget();
    }

    if (hasError) {
      return AppErrorWidget(
        message: errorMessage,
        onRetry: onRetry,
      );
    }

    return child;
  }
}
