import '../models/follow_up_models.dart';

/// Repository interface managing Follow-ups.
abstract class FollowUpsRepository {
  /// Fetches all follow-ups.
  Future<List<FollowUp>> getFollowUps();

  /// Adds a new follow-up.
  Future<void> addFollowUp(FollowUp followUp);
}
