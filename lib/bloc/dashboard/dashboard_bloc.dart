export 'dashboard_event.dart';
export 'dashboard_state.dart';

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/dashboard_repository.dart';
import 'dashboard_models.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

/// BLoC that manages states for the CRM Agent Dashboard.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  /// The dashboard repository.
  final DashboardRepository dashboardRepository;
  StreamSubscription<List<FollowUpCall>>? _followUpsSubscription;

  /// Initializes the BLoC with [DashboardInitial].
  DashboardBloc({required this.dashboardRepository})
    : super(const DashboardInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
    on<UpdateDashboardFollowUps>(_onUpdateDashboardFollowUps);

    _followUpsSubscription = dashboardRepository.followUpsStream.listen((
      calls,
    ) {
      add(UpdateDashboardFollowUps(calls));
    });
  }

  @override
  Future<void> close() {
    _followUpsSubscription?.cancel();
    return super.close();
  }

  Future<void> _onFetchDashboardData(
    FetchDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    try {
      final stats = await dashboardRepository.getStats();
      final followUps = await dashboardRepository.getFollowUps();
      emit(DashboardLoaded(stats: stats, followUps: followUps));
    } catch (e) {
      emit(const DashboardError(failure: DashboardFailure.load));
    }
  }

  void _onUpdateDashboardFollowUps(
    UpdateDashboardFollowUps event,
    Emitter<DashboardState> emit,
  ) {
    final s = state;
    if (s is DashboardLoaded) {
      emit(DashboardLoaded(stats: s.stats, followUps: event.followUps));
    }
  }
}
