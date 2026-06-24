import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a single row in the CallSummaryCard.
class CallSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isGreen;

  const CallSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
            ),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: value,
            style: TextStyle(
              color: isGreen ? AppColors.success : AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
