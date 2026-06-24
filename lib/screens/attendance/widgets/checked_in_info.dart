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
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.slate400,
              size: 13,
            ),
            AppSpacing.gapWXs,
            Expanded(
              child: Text(
                '$location · since $checkInTime',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.slate400),
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
