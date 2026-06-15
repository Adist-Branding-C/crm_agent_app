import 'package:flutter/material.dart';

/// A button representing a profile action (like Call or Email).
class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color textColor;
  final Color bgColor;

  /// Creates a [ProfileActionButton].
  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
