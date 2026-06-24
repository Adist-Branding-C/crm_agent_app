import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Reusable circular fingerprint icon used in the attendance check-in cards.
class FingerprintIcon extends StatelessWidget {
  /// The color of the icon.
  final Color iconColor;

  /// The background color of the circle container.
  final Color bgColor;

  /// Creates a constant [FingerprintIcon].
  const FingerprintIcon({
    super.key,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.ten),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(Icons.fingerprint_rounded, color: iconColor, size: 26),
    );
  }
}
