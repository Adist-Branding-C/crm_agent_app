import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';
import 'deals_presentation_extensions.dart';

/// Header for a single stage column in the Deals pipeline board.
class DealPipelineStageHeader extends StatelessWidget {
  /// The stage type.
  final DealStage stage;

  /// Number of deals in this stage.
  final int dealsCount;

  /// Total pipeline value for this stage.
  final double totalAmount;

  /// Creates a constant [DealPipelineStageHeader].
  const DealPipelineStageHeader({
    super.key,
    required this.stage,
    required this.dealsCount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.circle, size: 6.s, color: stage.color),
        SizedBox(width: AppSpacing.xs2),
        Text(
          stage.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textDark,
            fontSize: 13.s,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapWXs,
        Text(
          '$dealsCount',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w600,
            fontSize: 12.s
          ),
        ),
        const Spacer(),
        Text(
          totalAmount.toRupeeFormat(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w700,
            fontSize: 12.s
          ),
        ),
      ],
    );
  }
}
