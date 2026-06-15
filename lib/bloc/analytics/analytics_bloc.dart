import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'analytics_models.dart';
import 'mock_analytics.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

/// Business logic component managing state for the CRM Analytics view.
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  /// Initializes the BLoC with [AnalyticsInitial].
  AnalyticsBloc() : super(const AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoadAnalytics);
  }

  Future<void> _onLoadAnalytics(
    LoadAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(const AnalyticsLoading());
    try {
      // Simulate network request/database read latency
      await Future.delayed(const Duration(milliseconds: 300));
      emit(
        const AnalyticsLoaded(
          summary: mockAnalyticsSummary,
          statusMetrics: mockStatusMetrics,
          sourceMetrics: mockSourceMetrics,
        ),
      );
    } catch (e) {
      emit(const AnalyticsError(errorMessage: 'Failed to load analytics'));
    }
  }
}
