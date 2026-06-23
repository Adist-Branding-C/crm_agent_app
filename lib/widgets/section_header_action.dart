import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/context_text_extension.dart';

/// Trailing action text link for SectionHeader.
class SectionHeaderAction extends StatelessWidget {
  /// Label for trailing action text link.
  final String actionText;

  /// Trigger callback on action text press.
  final VoidCallback onActionTap;

  /// Creates a [SectionHeaderAction].
  const SectionHeaderAction({
    super.key,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActionTap,
      child: Text(
        actionText,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: context.scaleFont(13),
        ),
      ),
    );
  }
}
