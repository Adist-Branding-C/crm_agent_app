import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/analytics/analytics_models.dart';
import 'leads_by_source_card.dart';

class SourceMetricsSection extends StatelessWidget {
  const SourceMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnalyticsBloc, AnalyticsState, List<SourceMetric>>(
      selector: (state) =>
          state is AnalyticsLoaded ? state.sourceMetrics : const [],
      builder: (_, metrics) => LeadsBySourceCard(metrics: metrics),
    );
  }
}
