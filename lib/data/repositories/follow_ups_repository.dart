import '../../bloc/follow_ups/follow_ups_models.dart';

/// Repository interface managing Follow-ups.
abstract class FollowUpsRepository {
  /// Fetches all follow-ups.
  Future<List<FollowUp>> getFollowUps();
}

