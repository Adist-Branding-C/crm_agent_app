import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_bloc.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import 'deal_pipeline_stage_column.dart';

/// Renders the Kanban board (Pipeline view) scrollable horizontally.
class DealsPipelineView extends StatelessWidget {
  /// The list of deals.
  final List<Deal> deals;

  /// Creates a constant [DealsPipelineView].
  const DealsPipelineView({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    final grouped = deals.byStage;
    final totals = deals.stageTotals;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: AppSpacing.screenPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: grouped.entries
            .map(
              (e) => DealPipelineStageColumn(
                stage: e.key,
                stageDeals: e.value,
                totalAmount: totals[e.key] ?? 0,
              ),
            )
            .toList(),
      ),
    );
  }
}
