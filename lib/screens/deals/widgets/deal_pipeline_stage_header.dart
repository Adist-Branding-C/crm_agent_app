import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';

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
        Icon(Icons.circle, size: 8, color: stage.color),
        const SizedBox(width: 6),
        Text(
          stage.label,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$dealsCount',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          totalAmount.toRupeeFormat(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
