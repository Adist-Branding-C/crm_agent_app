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
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 12.s
            ),
          ),
        ),
        if (isRequired)
          Text(
            ' *',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.s
            ),
          ),
      ],
    );
  }
}
