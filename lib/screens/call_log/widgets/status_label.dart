import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class StatusLabel extends StatelessWidget {
  final String text;

  const StatusLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textDark)),
        Text(' *', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
