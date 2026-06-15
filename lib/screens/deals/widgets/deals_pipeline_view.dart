import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import 'deal_pipeline_stage_column.dart';

/// Renders the Kanban board (Pipeline view) scrollable horizontally.
class DealsPipelineView extends StatelessWidget {
  /// The list of deals.
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
          return DealPipelineStageColumn(
            stage: stage,
            stageDeals: stageDeals,
            totalAmount: totalAmount,
          );
        }).toList(),
      ),
    );
  }
}
