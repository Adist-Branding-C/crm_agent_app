part of 'analytics_bloc.dart';

/// The active tab on the Analytics screen.
enum AnalyticsTab { leads, deals }

/// Base class for all states emitted by the [AnalyticsBloc].
abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Analytics view.
class AnalyticsInitial extends AnalyticsState {
  const AnalyticsInitial();
}

/// State emitted while loading analytics data.
class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
}

/// State emitted when analytics data has been loaded successfully.
class AnalyticsLoaded extends AnalyticsState {
  final AnalyticsTab activeTab;
  final String selectedPeriod;
  final DateTime? customStartDate;
  final DateTime? customEndDate;
  final Set<LeadStatus> selectedStatuses;
  final Set<LeadSource> selectedSources;
  final LeadsSummary leadsSummary;
  final DealsSummary dealsSummary;
  final List<StatusMetric> statusMetrics;
  final List<SourceMetric> sourceMetrics;
  final List<DealStageMetric> dealStageMetrics;
  final List<PipelineValueStageMetric> pipelineValueStageMetrics;
  final List<DealTypeMetric> dealTypeMetrics;

  const AnalyticsLoaded({
    required this.activeTab,
    required this.selectedPeriod,
    this.customStartDate,
    this.customEndDate,
    required this.selectedStatuses,
    required this.selectedSources,
    required this.leadsSummary,
    required this.dealsSummary,
    required this.statusMetrics,
    required this.sourceMetrics,
    required this.dealStageMetrics,
    required this.pipelineValueStageMetrics,
    required this.dealTypeMetrics,
  });

  @override
  List<Object?> get props => [
        activeTab, selectedPeriod, customStartDate, customEndDate,
        selectedStatuses, selectedSources, leadsSummary, dealsSummary,
        statusMetrics, sourceMetrics, dealStageMetrics,
        pipelineValueStageMetrics, dealTypeMetrics,
      ];
}

enum AnalyticsFailure { load, unknown }

/// State emitted when loading analytics data fails.
class AnalyticsError extends AnalyticsState {
  final AnalyticsFailure failure;
  const AnalyticsError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
