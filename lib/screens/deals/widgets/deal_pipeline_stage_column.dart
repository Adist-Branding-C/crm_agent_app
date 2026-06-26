import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import 'deal_pipeline_card.dart';
import 'deal_pipeline_stage_header.dart';

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
      width: 150.w,
      margin: EdgeInsets.only(right: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DealPipelineStageHeader(
            stage: stage,
            dealsCount: stageDeals.length,
            totalAmount: totalAmount,
          ),
          AppSpacing.gapXl,
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
}
