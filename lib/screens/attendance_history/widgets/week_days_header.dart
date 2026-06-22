import 'package:flutter/material.dart';
import '../../../theme.dart';

class WeekDaysHeader extends StatelessWidget {
  const WeekDaysHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((d) => SizedBox(
        width: 32,
        child: Align(
          alignment: Alignment.center,
          child: Text(d, style: const TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w500)),
        ),
      )).toList(),
    );
  }
}
