import 'package:flutter/material.dart';
import '../../../utils/context_text_extension.dart';

/// A reusable action button for details screens.
class QuickActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  const QuickActionButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.scaleFont(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
