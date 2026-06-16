import '../../bloc/dashboard/dashboard_models.dart';
import 'dashboard_repository.dart';

/// Concrete implementation of [DashboardRepository] pre-seeded with mock data.
class DashboardRepositoryImpl implements DashboardRepository {
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
    return const [
      FollowUpCall(
        tag: FollowUpTag.priority,
        name: 'Call back Rahul Menon',
        time: 'Today, 4:00 PM',
      ),
      FollowUpCall(
        tag: FollowUpTag.followUp,
        name: 'Call back Sneha Pillai',
        time: 'Today, 5:30 PM',
      ),
      FollowUpCall(
        tag: FollowUpTag.priority,
        name: 'Call back Aravind Krishnan',
        time: 'Today, 6:00 PM',
      ),
    ];
  }

  @override
  Future<List<TaskItem>> getTasks() async {
    return const [
      TaskItem(type: TaskType.call, name: 'Rahul Menon', time: 'Today, 4:00 PM'),
      TaskItem(type: TaskType.task, name: 'Sneha Pillai', time: 'Today, 5:30 PM'),
      TaskItem(type: TaskType.meeting, name: 'Aravind Krishnan', time: 'Today, 6:00 PM'),
    ];
  }
}
