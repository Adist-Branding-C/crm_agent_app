import 'package:flutter/material.dart';
import '../../../theme.dart';

class HistoryProgressCircle extends StatelessWidget {
  final double attendanceRate;

  const HistoryProgressCircle({super.key, required this.attendanceRate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: attendanceRate / 100,
            strokeWidth: 6,
            color: AppColors.success,
            backgroundColor: AppColors.slate600,
          ),
          Text(
            '${attendanceRate.toInt()}%',
            style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
