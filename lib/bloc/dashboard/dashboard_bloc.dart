import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/dashboard_repository.dart';
import 'dashboard_models.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// BLoC that manages states for the CRM Agent Dashboard.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  /// The dashboard repository.
  final DashboardRepository dashboardRepository;

  /// Initializes the BLoC with [DashboardInitial].
  DashboardBloc({required this.dashboardRepository})
      : super(const DashboardInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(
    FetchDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    try {
      final stats = await dashboardRepository.getStats();
      final followUps = await dashboardRepository.getFollowUps();
      final tasks = await dashboardRepository.getTasks();
      emit(DashboardLoaded(stats: stats, followUps: followUps, tasks: tasks));
    } catch (e) {
      emit(
        const DashboardError(errorMessage: 'Failed to fetch dashboard data'),
      );
    }
  }
}
