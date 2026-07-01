import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Text information segment for CheckedOutCardBody.
class CheckedOutInfo extends StatelessWidget {
  /// Creates a constant [CheckedOutInfo].
  const CheckedOutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start your day',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapXs,
        Text(
          'Punch in to log attendance',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
