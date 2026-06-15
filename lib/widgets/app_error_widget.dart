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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.errorColor,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
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
