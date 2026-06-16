import '../../bloc/follow_ups/follow_ups_models.dart';
import '../../bloc/follow_ups/mock_follow_ups.dart';

/// Repository interface managing Follow-ups.
abstract class FollowUpsRepository {
  /// Fetches all follow-ups.
  Future<List<FollowUp>> getFollowUps();
}

/// Concrete implementation of [FollowUpsRepository] with mock data.
class FollowUpsRepositoryImpl implements FollowUpsRepository {
  @override
  Future<List<FollowUp>> getFollowUps() async {
    return mockFollowUps;
  }
}
