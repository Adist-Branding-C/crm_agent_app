part of 'dashboard_bloc.dart';

/// Base class for all Dashboard Bloc events.
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load/fetch dashboard data.
class FetchDashboardData extends DashboardEvent {
  const FetchDashboardData();
}

class UpdateDashboardFollowUps extends DashboardEvent {
  final List<FollowUpCall> followUps;
  const UpdateDashboardFollowUps(this.followUps);

  @override
  List<Object?> get props => [followUps];
}
