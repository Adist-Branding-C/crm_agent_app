import 'package:flutter/material.dart';
import '../../../theme.dart';

class HistoryProgressCircle extends StatelessWidget {
  final double attendanceRate;

  const HistoryProgressCircle({super.key, required this.attendanceRate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 65.w,
            height: 65.w,
            child: CircularProgressIndicator(
              value: attendanceRate / 100,
              strokeWidth: 8.w,
              color: AppColors.success,

              backgroundColor: AppColors.slate600,
            ),
          ),
          Text(
            '${attendanceRate.toInt()}%',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
