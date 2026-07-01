import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Text information segment for CheckedInCardBody.
class CheckedInInfo extends StatelessWidget {
  final String location;
  final String? checkInTime;

  /// Creates a constant [CheckedInInfo].
  const CheckedInInfo({super.key, required this.location, this.checkInTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You're checked in",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapXs,
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.slate400,
              size: 14.s,
            ),
            AppSpacing.gapWXs,
            Expanded(
              child: Text(
                location,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.slate400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        AppSpacing.gapXs,
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            'since $checkInTime',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.slate400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
