import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import 'deal_pipeline_card.dart';

/// Renders the Kanban board (Pipeline view) scrollable horizontally.
class DealsPipelineView extends StatelessWidget {
  final List<Deal> deals;

  /// Creates a constant [DealsPipelineView].
  const DealsPipelineView({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: DealStage.values.map((stage) {
          final stageDeals = deals.where((d) => d.stage == stage).toList();
          final totalAmount = stageDeals.fold(0.0, (sum, d) => sum + d.amount);
          return _buildStageColumn(stage, stageDeals, totalAmount);
        }).toList(),
      ),
    );
  }

  Widget _buildStageColumn(
    DealStage stage,
    List<Deal> stageDeals,
    double totalAmount,
  ) {
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
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${stageDeals.length}',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                _formatAmount(totalAmount),
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...stageDeals.map((deal) => DealPipelineCard(deal: deal)),
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
