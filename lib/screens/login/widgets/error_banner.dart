import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Alert notification box rendering validation failures.
class ErrorBanner extends StatelessWidget {
  /// Creates a constant [ErrorBanner] widget with [message].
  const ErrorBanner({super.key, required this.message});

  /// The error message text.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Error message: $message',
      liveRegion: true,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppTheme.errorBackground,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.errorBorder, width: 1.w),
        ),
        child: Row(
          children: [
             Icon(
              Icons.warning_amber_rounded,
              color: AppTheme.errorColor,
              size: 20.s,
            ),
            AppSpacing.gapWSm,
            Expanded(
              child: Text(
                message,
                style:  TextStyle(
                  color: AppTheme.errorColor,
                  fontSize: 13.s,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
