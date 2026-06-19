import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Date section header separating activity groups.
class MyActivityDateHeader extends StatelessWidget {
  final String dateLabel;

  const MyActivityDateHeader({super.key, required this.dateLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        dateLabel,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}
