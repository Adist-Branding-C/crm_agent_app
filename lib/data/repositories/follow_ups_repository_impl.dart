import '../../bloc/follow_ups/follow_ups_models.dart';
import '../../bloc/follow_ups/mock_follow_ups.dart';
import 'follow_ups_repository.dart';

/// Concrete implementation of [FollowUpsRepository] with mock data.
class FollowUpsRepositoryImpl implements FollowUpsRepository {
  @override
  Future<List<FollowUp>> getFollowUps() async {
    return mockFollowUps;
  }
}
