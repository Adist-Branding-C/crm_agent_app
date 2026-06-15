import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import 'deal_pipeline_card.dart';

/// Renders a single stage column in the Deals pipeline board.
class DealPipelineStageColumn extends StatelessWidget {
  /// The stage type.
  final DealStage stage;

  /// The list of deals in this stage.
  final List<Deal> stageDeals;

  /// Total pipeline value for this stage.
  final double totalAmount;

  /// Creates a constant [DealPipelineStageColumn].
  const DealPipelineStageColumn({
    super.key,
    required this.stage,
    required this.stageDeals,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 8, color: stage.color),
              const SizedBox(width: 6),
              Text(
                stage.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
              ),
              const SizedBox(width: 4),
              Text(
                '${stageDeals.length}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
              Text(
                _formatAmount(totalAmount),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: stageDeals.isEmpty
                ? Center(
                    child: Text(
                      'No deals yet',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: stageDeals.length,
                    itemBuilder: (context, index) {
                      return DealPipelineCard(deal: stageDeals[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(2)}L';
    }
    return '₹${(amount / 1000).toStringAsFixed(0)}K';
  }
}
