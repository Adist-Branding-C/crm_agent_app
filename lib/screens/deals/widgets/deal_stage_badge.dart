import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import 'deals_presentation_extensions.dart';

/// Renders the stage badge for a deal.
class DealStageBadge extends StatelessWidget {
  final DealStage stage;

  /// Creates a constant [DealStageBadge].
  const DealStageBadge({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.ten,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: stage.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        stage.label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: stage.color,
          fontWeight: FontWeight.bold,
          fontSize: 10.s,
        ),
      ),
    );
  }
}
