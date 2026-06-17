import '../../bloc/dashboard/dashboard_models.dart';

/// Repository interface managing Dashboard statistics and tasks.
abstract class DashboardRepository {
  /// Fetches summary stats for dashboard widgets.
  Future<DashboardStats> getStats();

  /// Fetches pending follow-up calls.
  Future<List<FollowUpCall>> getFollowUps();
}

