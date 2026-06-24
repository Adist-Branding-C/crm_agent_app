import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

/// Renders a single field item with a muted label and custom value or child.
class InfoItemTile extends StatelessWidget {
  /// The label describing the item.
  final String label;

  /// The text value of the item (optional).
  final String? value;

  /// Custom child widget to display instead of text (optional).
  final Widget? child;

  /// Custom color for the text value (optional).
  final Color? valueColor;

  /// Creates a constant [InfoItemTile].
  const InfoItemTile({
    super.key,
    required this.label,
    this.value,
    this.child,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSpacing.gapXs,
          if (child != null)
            Row(children: [child!])
          else
            Text(
              value ?? '',
              style: TextStyle(
                fontSize: context.scaleFont(15),
                fontWeight: FontWeight.w600,
                color: valueColor ?? AppColors.textDark,
              ),
            ),
          AppSpacing.gapSm,
          const Divider(color: AppColors.borderLight, height: 1, thickness: 0.5),
        ],
      ),
    );
  }
}
