import 'package:flutter/material.dart';
import '../../../theme.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'May 2026',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            fontSize: 14.s
          ),
        ),
        Text(
          'Through 12 May',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textMuted,fontSize: 13),
        ),
      ],
    );
  }
}
