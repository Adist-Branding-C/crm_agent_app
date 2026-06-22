import 'package:flutter/material.dart';
import '../../../theme.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('May 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
        Text('Through 12 May', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }
}
