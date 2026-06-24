import 'dart:async';
import '../models/dashboard_models.dart';
import 'dashboard_repository.dart';

/// Concrete implementation of [DashboardRepository] pre-seeded with mock data.
class DashboardRepositoryImpl implements DashboardRepository {
  final _followUpsController = StreamController<List<FollowUpCall>>.broadcast();

  final List<FollowUpCall> _followUps = [
    const FollowUpCall(
      tag: FollowUpTag.priority,
      name: 'Call back Rahul Menon',
      time: 'Today, 4:00 PM',
    ),
    const FollowUpCall(
      tag: FollowUpTag.followUp,
      name: 'Call back Sneha Pillai',
      time: 'Today, 5:30 PM',
    ),
    const FollowUpCall(
      tag: FollowUpTag.priority,
      name: 'Call back Aravind Krishnan',
      time: 'Today, 6:00 PM',
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
}
