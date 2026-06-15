import 'package:flutter/material.dart';

/// Renders the title and checked in status in the dashboard header.
class HeaderTitle extends StatelessWidget {
  /// Creates a constant [HeaderTitle].
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(Icons.circle, size: 8, color: Color(0xFF10B981)),
            SizedBox(width: 6),
            Text(
              'Checked in • 9:02 AM',
              style: TextStyle(
                color: Color(0xFF10B981),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
