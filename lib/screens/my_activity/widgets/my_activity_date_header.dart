import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Date section header separating activity groups.
class MyActivityDateHeader extends StatelessWidget {
  final String dateLabel;

  const MyActivityDateHeader({super.key, required this.dateLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.sm),
      child: Text(
        dateLabel,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}
