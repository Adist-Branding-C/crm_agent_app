import 'dart:async';
import '../models/dashboard_models.dart';
import 'dashboard_repository.dart';

/// Concrete implementation of [DashboardRepository] pre-seeded with mock data.
class DashboardRepositoryImpl implements DashboardRepository {
  final _followUpsController = StreamController<List<FollowUpCall>>.broadcast();

  final List<FollowUpCall> _followUps = [
    FollowUpCall(
      id: '1',
      tag: FollowUpTag.priority,
      name: 'Call back Rahul Menon',
      time: 'Today, 4:00 PM',
      description: 'Follow up on admission inquiry',
      scheduledTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    FollowUpCall(
      id: '2',
      tag: FollowUpTag.followUp,
      name: 'Call back Sneha Pillai',
      time: 'Today, 5:30 PM',
      description: 'Share course details',
      scheduledTime: DateTime.now().add(const Duration(minutes: 30)),
    ),
    FollowUpCall(
      id: '3',
      tag: FollowUpTag.priority,
      name: 'Call back Aravind Krishnan',
      time: 'Today, 6:00 PM',
      description: 'Confirm demo slot',
      scheduledTime: DateTime.now().add(const Duration(hours: 1)),
    ),
  ];

  @override
  Future<DashboardStats> getStats() async {
    return const DashboardStats(
      activeCampaigns: 3,
      openDeals: 7,
      analyticsConversionRate: 64.0,
      attendanceStatus: 'In today',
    );
  }

  @override
  Future<List<FollowUpCall>> getFollowUps() async {
    return List.from(_followUps);
  }

  @override
  Future<void> addFollowUp(FollowUpCall followUp) async {
    _followUps.add(followUp);
    _followUpsController.add(List.from(_followUps));
  }

  @override
  Stream<List<FollowUpCall>> get followUpsStream => _followUpsController.stream;

  @override
  void dispose() {
    _followUpsController.close();
  }
}
