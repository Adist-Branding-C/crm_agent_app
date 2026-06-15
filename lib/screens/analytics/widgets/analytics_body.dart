import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/analytics/analytics_models.dart';
import '../../../widgets/async_state_view.dart';
import 'analytics_grid.dart';
import 'leads_by_source_card.dart';
import 'leads_by_status_card.dart';

/// Renders the core scrollable metrics and charts of the Analytics Screen.
class AnalyticsBody extends StatelessWidget {
  /// Creates a constant [AnalyticsBody].
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        final summary = state is AnalyticsLoaded
            ? state.summary
            : const AnalyticsSummary(
                totalLeads: 0,
                conversionRate: 0.0,
                wonDeals: 0,
                pipelineValue: '₹0',
              );

        final statusMetrics = state is AnalyticsLoaded
            ? state.statusMetrics
            : const <StatusMetric>[];
        final sourceMetrics = state is AnalyticsLoaded
            ? state.sourceMetrics
            : const <SourceMetric>[];

        return AsyncStateView(
          isLoading: state is AnalyticsLoading || state is AnalyticsInitial,
          hasError: state is AnalyticsError,
          errorMessage: state is AnalyticsError ? state.errorMessage : 'Error',
          onRetry: () =>
              context.read<AnalyticsBloc>().add(const LoadAnalytics()),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                AnalyticsGrid(summary: summary),
                const SizedBox(height: 24),
                LeadsByStatusCard(metrics: statusMetrics),
                const SizedBox(height: 24),
                LeadsBySourceCard(metrics: sourceMetrics),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
