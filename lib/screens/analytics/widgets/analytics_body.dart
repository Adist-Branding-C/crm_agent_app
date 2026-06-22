import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/error_messages.dart';
import '../../../widgets/async_state_view.dart';
import 'analytics_tab_toggle.dart';
import 'analytics_period_dropdown.dart';
import 'leads_tab_content.dart';
import 'deals_tab_content.dart';

class AnalyticsBody extends StatelessWidget {
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AnalyticsBloc>();
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType ||
          (curr is AnalyticsLoaded && prev is AnalyticsLoaded &&
              (prev.activeTab != curr.activeTab ||
               prev.leadsData != curr.leadsData ||
               prev.dealsData != curr.dealsData)),
      builder: (context, state) {
        return AsyncStateView(
          isLoading: state is AnalyticsLoading || state is AnalyticsInitial,
          hasError: state is AnalyticsError,
          errorMessage: state is AnalyticsError ? state.failure.message : 'Error',
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
                      if (state.activeTab == AnalyticsTab.leads && state.leadsData != null)
                        LeadsTabContent(
                          summary: state.leadsData!.summary,
                          statusMetrics: state.leadsData!.statusMetrics,
                          sourceMetrics: state.leadsData!.sourceMetrics,
                        )
                      else if (state.dealsData != null)
                        DealsTabContent(
                          summary: state.dealsData!.summary,
                          stageMetrics: state.dealsData!.stageMetrics,
                          pipelineMetrics: state.dealsData!.pipelineMetrics,
                          typeMetrics: state.dealsData!.typeMetrics,
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
