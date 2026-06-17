import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/analytics/analytics_models.dart';
import 'leads_by_status_card.dart';

class StatusMetricsSection extends StatelessWidget {
  const StatusMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnalyticsBloc, AnalyticsState, List<StatusMetric>>(
      selector: (state) =>
          state is AnalyticsLoaded ? state.statusMetrics : const [],
      builder: (_, metrics) => LeadsByStatusCard(metrics: metrics),
    );
  }
}
