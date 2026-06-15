import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Text information segment for CheckedOutCardBody.
class CheckedOutInfo extends StatelessWidget {
  /// Creates a constant [CheckedOutInfo].
  const CheckedOutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start your day',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.textMuted,
              size: 13,
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                'Punch in to log attendance',
                style: TextStyle(color: AppColors.textMuted, fontSize: 11),
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
