import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/context_text_extension.dart';

/// A reusable, brand-styled Call button with icons and glow shadows.
class CallButton extends StatelessWidget {
  /// Optional callback for when the button is tapped.
  final VoidCallback? onTap;

  /// Corner radius of the button (defaults to 8).
  final double borderRadius;

  /// Creates a constant [CallButton].
  const CallButton({super.key, this.onTap, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: AppTheme.buttonShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.call_rounded, color: Colors.white, size: 14),
                const SizedBox(width: 6),
                Text(
                  'Call',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.scaleFont(13),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
