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
    final byStage = {for (final s in DealStage.values) s: deals.where((d) => d.stage == s).toList()};
    final totals = {for (final e in byStage.entries) e.key: e.value.fold(0.0, (s, d) => s + d.amount)};
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: byStage.entries.map((e) => DealPipelineStageColumn(
          stage: e.key,
          stageDeals: e.value,
          totalAmount: totals[e.key] ?? 0,
        )).toList(),
      ),
    );
  }
}
