import 'package:flutter/material.dart';
import '../theme.dart';

/// A reusable loading spinner widget aligned with the app theme.
class AppLoadingWidget extends StatelessWidget {
  /// Optional custom size for the spinner.
  final double size;

  /// Creates an [AppLoadingWidget].
  const AppLoadingWidget({super.key, this.size = 36});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
