import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'analytics_tab_toggle.dart';
import 'analytics_period_dropdown.dart';
import 'leads_tab_content.dart';
import 'deals_tab_content.dart';

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
      builder: (context, state) {
        final bloc = context.read<AnalyticsBloc>();
        return AsyncStateView(
          isLoading: state is AnalyticsLoading || state is AnalyticsInitial,
          hasError: state is AnalyticsError,
          errorMessage: state is AnalyticsError ? _analyticsErrorString(state.failure) : 'Error',
          onRetry: () => bloc.add(const LoadAnalytics()),
          child: state is AnalyticsLoaded
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      AnalyticsTabToggle(
                        activeTab: state.activeTab,
                        onTabChanged: (tab) => bloc.add(ChangeTab(tab)),
                      ),
                      const SizedBox(height: 20),
                      AnalyticsPeriodDropdown(
                        selectedPeriod: state.selectedPeriod,
                        onPeriodChanged: (p) => bloc.add(ChangePeriod(p)),
                      ),
                      const SizedBox(height: 20),
                      if (state.activeTab == AnalyticsTab.leads)
                        LeadsTabContent(
                          summary: state.leadsSummary,
                          statusMetrics: state.statusMetrics,
                          sourceMetrics: state.sourceMetrics,
                        )
                      else
                        DealsTabContent(
                          summary: state.dealsSummary,
                          stageMetrics: state.dealStageMetrics,
                          pipelineMetrics: state.pipelineValueStageMetrics,
                          typeMetrics: state.dealTypeMetrics,
                        ),
                      const SizedBox(height: 24),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
