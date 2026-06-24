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
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.textMuted,
              size: 13,
            ),
            AppSpacing.gapWXs,
            Expanded(
              child: Text(
                'Punch in to log attendance',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
