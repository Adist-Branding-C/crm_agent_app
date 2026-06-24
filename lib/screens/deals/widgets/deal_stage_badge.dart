import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import '../../../../utils/context_text_extension.dart';
import 'deals_presentation_extensions.dart';

/// Renders the stage badge for a deal.
class DealStageBadge extends StatelessWidget {
  final DealStage stage;

  /// Creates a constant [DealStageBadge].
  const DealStageBadge({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = stage.color;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.ten, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        stage.label,
        style: TextStyle(
          color: baseColor,
          fontWeight: FontWeight.bold,
          fontSize: context.scaleFont(11),
        ),
      ),
    );
  }
}
