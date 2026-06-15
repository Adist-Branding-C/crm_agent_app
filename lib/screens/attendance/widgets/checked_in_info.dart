import 'package:flutter/material.dart';

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
              color: Color(0xFF94A3B8),
              size: 13,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '$location · since $checkInTime',
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
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
