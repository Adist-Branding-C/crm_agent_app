import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_models.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// BLoC that manages states for the CRM Agent Dashboard.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  /// Initializes the BLoC with [DashboardInitial].
  DashboardBloc() : super(const DashboardInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(
    FetchDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    try {
      // Mock API call latency
      await Future.delayed(const Duration(milliseconds: 600));

      const stats = DashboardStats(
        activeCampaigns: 3,
        openDeals: 7,
        analyticsConversionRate: 64.0,
        attendanceStatus: 'In today',
      );

      const followUps = [
        FollowUpCall(
          tag: 'priority',
          name: 'Call back Rahul Menon',
          time: 'Today, 4:00 PM',
        ),
        FollowUpCall(
          tag: 'follow up',
          name: 'Call back Sneha Pillai',
          time: 'Today, 5:30 PM',
        ),
        FollowUpCall(
          tag: 'priority',
          name: 'Call back Aravind Krishnan',
          time: 'Today, 6:00 PM',
        ),
      ];

      const tasks = [
        TaskItem(type: 'Call', name: 'Rahul Menon', time: 'Today, 4:00 PM'),
        TaskItem(type: 'Task', name: 'Sneha Pillai', time: 'Today, 5:30 PM'),
        TaskItem(
          type: 'Meeting',
          name: 'Aravind Krishnan',
          time: 'Today, 6:00 PM',
        ),
      ];

      emit(
        const DashboardLoaded(stats: stats, followUps: followUps, tasks: tasks),
      );
    } catch (e) {
      emit(
        const DashboardError(errorMessage: 'Failed to fetch dashboard data'),
      );
    }
  }
}
