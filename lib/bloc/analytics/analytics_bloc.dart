import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import 'analytics_models.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

/// Business logic component managing state for the CRM Analytics view.
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  /// The analytics metrics repository.
  final AnalyticsRepository analyticsRepository;

  /// Initializes the BLoC with [AnalyticsInitial].
  AnalyticsBloc({required this.analyticsRepository})
      : super(const AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoadAnalytics);
  }

  Future<void> _onLoadAnalytics(
    LoadAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(const AnalyticsLoading());
    try {
      final summary = await analyticsRepository.getAnalyticsSummary();
      final statusMetrics = await analyticsRepository.getStatusMetrics();
      final sourceMetrics = await analyticsRepository.getSourceMetrics();
      emit(
        AnalyticsLoaded(
          summary: summary,
          statusMetrics: statusMetrics,
          sourceMetrics: sourceMetrics,
        ),
      );
    } catch (e) {
      emit(const AnalyticsError(failure: AnalyticsFailure.load));
    }
  }
}
