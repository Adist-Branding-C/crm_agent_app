part of 'analytics_bloc.dart';

/// Base class for all states emitted by the [AnalyticsBloc].
abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Analytics section before loading data.
class AnalyticsInitial extends AnalyticsState {
  const AnalyticsInitial();
}

/// State emitted while fetching/loading analytics data.
class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
}

/// State emitted when analytics data has been loaded successfully.
class AnalyticsLoaded extends AnalyticsState {
  /// The summary of main analytics metrics.
  final AnalyticsSummary summary;

  /// List of leads segmented by status.
  final List<StatusMetric> statusMetrics;

  /// List of leads segmented by source.
  final List<SourceMetric> sourceMetrics;

  /// Creates a constant [AnalyticsLoaded] state.
  const AnalyticsLoaded({
    required this.summary,
    required this.statusMetrics,
    required this.sourceMetrics,
  });

  @override
  List<Object?> get props => [summary, statusMetrics, sourceMetrics];
}

/// State emitted when loading analytics data fails.
class AnalyticsError extends AnalyticsState {
  /// The descriptive error message.
  final String errorMessage;

  /// Creates a constant [AnalyticsError] state.
  const AnalyticsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
