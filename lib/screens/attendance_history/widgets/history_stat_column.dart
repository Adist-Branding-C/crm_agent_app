import 'package:flutter/material.dart';
import '../../../theme.dart';

class HistoryStatColumn extends StatelessWidget {
  final String value;
  final String label;

  const HistoryStatColumn({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13,
          ),
        ),
        Text(label, style: const TextStyle(color: AppColors.slate400, fontSize: 11)),
      ],
    );
  }
}
