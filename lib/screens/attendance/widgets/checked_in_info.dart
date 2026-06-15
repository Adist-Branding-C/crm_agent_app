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
        const Text(
          "You're checked in",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.slate400,
              size: 13,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '$location · since $checkInTime',
                style: const TextStyle(color: AppColors.slate400, fontSize: 11),
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
