import '../models/dashboard_models.dart';

/// Repository interface managing Dashboard statistics and tasks.
abstract class DashboardRepository {
  /// Fetches summary stats for dashboard widgets.
  Future<DashboardStats> getStats();

  /// Fetches all follow-ups.
  Future<List<FollowUpCall>> getFollowUps();

  /// Adds a new follow-up.
  Future<void> addFollowUp(FollowUpCall followUp);

  /// A stream of follow-up call list updates.
  Stream<List<FollowUpCall>> get followUpsStream;
}
