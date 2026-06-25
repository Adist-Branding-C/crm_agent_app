import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Regulatory/Disclaimer notice at page bottom.
class DisclaimerText extends StatelessWidget {
  /// Creates a constant [DisclaimerText] widget.
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Only authorised staff can access this app.\nContact your branch admin for access.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppTheme.textMuted.withValues(alpha: 0.6),
        fontSize: 12,
        height: 1.5,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
