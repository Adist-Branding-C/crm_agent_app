part of 'dashboard_bloc.dart';

/// Base class for all states of the Dashboard.
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the dashboard before loading data.
class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

/// State emitted while loading dashboard data.
class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

/// State emitted when dashboard data is loaded successfully.
class DashboardLoaded extends DashboardState {
  final DashboardStats stats;
  final List<FollowUpCall> followUps;

  const DashboardLoaded({
    required this.stats,
    required this.followUps,
  });

  @override
  List<Object?> get props => [stats, followUps];
}

/// State emitted when dashboard data loading fails.
class DashboardError extends DashboardState {
  final String errorMessage;

  const DashboardError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
