import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/analytics/analytics_bloc.dart';
import '../../theme.dart';
import 'widgets/analytics_grid.dart';
import 'widgets/analytics_header.dart';
import 'widgets/leads_by_source_card.dart';
import 'widgets/leads_by_status_card.dart';

/// The root Analytics Screen.
class AnalyticsScreen extends StatelessWidget {
  /// Creates a constant [AnalyticsScreen].
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsBloc()..add(const LoadAnalytics()),
      child: const Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              AnalyticsHeader(),
              Expanded(child: _AnalyticsBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalyticsBody extends StatelessWidget {
  const _AnalyticsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        if (state is AnalyticsLoading || state is AnalyticsInitial) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
        if (state is AnalyticsLoaded) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                AnalyticsGrid(summary: state.summary),
                const SizedBox(height: 24),
                LeadsByStatusCard(metrics: state.statusMetrics),
                const SizedBox(height: 24),
                LeadsBySourceCard(metrics: state.sourceMetrics),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        final msg = state is AnalyticsError ? state.errorMessage : 'Error';
        return Center(
          child: Text(msg, style: const TextStyle(color: AppColors.errorColor)),
        );
      },
    );
  }
}
