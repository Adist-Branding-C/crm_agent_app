import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
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
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
