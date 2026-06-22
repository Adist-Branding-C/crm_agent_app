import 'package:flutter/material.dart';
import '../theme.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const TextFieldLabel({
    super.key,
    required this.label,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (isRequired)
          const Text(
            ' *',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
