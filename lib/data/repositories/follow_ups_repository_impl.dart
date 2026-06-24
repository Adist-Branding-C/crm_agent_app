import '../models/follow_up_models.dart';
import '../models/mock_follow_ups.dart';
import 'follow_ups_repository.dart';

/// Concrete implementation of [FollowUpsRepository] with mock data.
class FollowUpsRepositoryImpl implements FollowUpsRepository {
  @override
  Future<List<FollowUp>> getFollowUps() async {
    return mockFollowUps;
  }
}
