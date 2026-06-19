import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'analytics_summary_grid.dart';
import 'status_metrics_section.dart';
import 'source_metrics_section.dart';

String _analyticsErrorString(AnalyticsFailure f) {
  switch (f) {
    case AnalyticsFailure.load: return 'Failed to load analytics';
    case AnalyticsFailure.unknown: return 'An error occurred';
  }
}

class AnalyticsBody extends StatelessWidget {
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        return AsyncStateView(
          isLoading: state is AnalyticsLoading || state is AnalyticsInitial,
          hasError: state is AnalyticsError,
          errorMessage: state is AnalyticsError ? _analyticsErrorString(state.failure) : 'Error',
          onRetry: () =>
              context.read<AnalyticsBloc>().add(const LoadAnalytics()),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Column(
              children: [
                AnalyticsSummaryGrid(),
                SizedBox(height: 24),
                StatusMetricsSection(),
                SizedBox(height: 24),
                SourceMetricsSection(),
                SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
