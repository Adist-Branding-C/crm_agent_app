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
            fontSize: 15.s,
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
            Text(
              '$location ',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.slate400,
                fontSize: 13.s,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Text(
          '· since $checkInTime',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.slate400,
            fontSize: 13.s,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
