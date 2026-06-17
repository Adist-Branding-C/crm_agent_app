import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/analytics/analytics_models.dart';
import 'analytics_grid.dart';

class AnalyticsSummaryGrid extends StatelessWidget {
  const AnalyticsSummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnalyticsBloc, AnalyticsState, AnalyticsSummary>(
      selector: (state) => state is AnalyticsLoaded
          ? state.summary
          : const AnalyticsSummary(
              totalLeads: 0, conversionRate: 0.0, wonDeals: 0, pipelineValue: '₹0'),
      builder: (_, summary) => AnalyticsGrid(summary: summary),
    );
  }
}
