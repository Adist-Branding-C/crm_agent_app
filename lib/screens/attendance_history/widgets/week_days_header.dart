import 'package:flutter/material.dart';
import '../../../theme.dart';

class WeekDaysHeader extends StatelessWidget {
  const WeekDaysHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: Text(
                  d,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.s
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
