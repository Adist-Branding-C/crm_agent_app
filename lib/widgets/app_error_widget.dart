import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_button.dart';



/// A reusable error display widget with retry callback.
class AppErrorWidget extends StatelessWidget {
  /// The error message.
  final String message;

  /// Action callback to retry the failed operation.
  final VoidCallback onRetry;

  /// Creates an [AppErrorWidget].
  const AppErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.errorColor,
              size: 48,
            ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.xxl),
            SizedBox(
              width: 140,
              child: CustomButton(
                text: 'Retry',
                onPressed: onRetry,
                icon: Icons.refresh_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
