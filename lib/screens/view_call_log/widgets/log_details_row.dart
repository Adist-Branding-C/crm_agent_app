import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a single row element with key-value data styled with custom colors.
class LogDetailsRow extends StatelessWidget {
  /// Label text for this details row.
  final String label;

  /// String value to display.
  final String value;

  /// Color palette containing [text, background, border] colors.
  final List<Color> colors;

  /// Creates a constant [LogDetailsRow].
  const LogDetailsRow({
    super.key,
    required this.label,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: colors[1],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors[2]),
            ),
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colors[0],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
