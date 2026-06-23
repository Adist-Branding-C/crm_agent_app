import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// An individual menu item displaying an icon and text badge inside [FabMenu].
class FabMenuItem extends StatelessWidget {
  /// The text label.
  final String text;

  /// The icon vector.
  final IconData icon;

  /// The color of the icon.
  final Color color;

  /// Trigger callback on tap.
  final VoidCallback onTap;

  /// Creates a [FabMenuItem].
  const FabMenuItem({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackAlpha5,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(icon, color: color, size: 20),
          ),
        ],
      ),
    );
  }
}
