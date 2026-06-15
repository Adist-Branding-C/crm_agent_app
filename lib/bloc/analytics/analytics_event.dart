part of 'analytics_bloc.dart';

/// Base class for all events handled by the [AnalyticsBloc].
abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to trigger fetching/loading of analytics data.
class LoadAnalytics extends AnalyticsEvent {
  const LoadAnalytics();
}
