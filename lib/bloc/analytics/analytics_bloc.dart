import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';
import 'analytics_query_handlers.dart';
import 'analytics_filter_handlers.dart';

export 'analytics_event.dart';
export 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository analyticsRepository;

  AnalyticsBloc({required this.analyticsRepository})
    : super(const AnalyticsInitial()) {
    on<LoadAnalytics>(onLoad);
    on<ChangeTab>(onChangeTab);
    on<ChangePeriod>(onChangePeriod);
    on<ApplyFilters>(onApplyFilters);
  }
}
