import '../../bloc/notifications/notifications_models.dart';
import 'notifications_repository.dart';

/// Concrete implementation of [NotificationsRepository] returning mock data.
class NotificationsRepositoryImpl implements NotificationsRepository {
  final List<NotificationItem> _mockNotifications = [
    const NotificationItem(
      id: '1', title: 'New lead assigned',
      subtitle: 'Divya Raveendran • Instagram enquiry',
      time: '5 min ago', type: NotificationType.lead, isRead: false,
      routePath: '/enquiry-details/4',
    ),
    const NotificationItem(
      id: '2', title: 'Follow-up call due',
      subtitle: 'Call back Lakshmi Warrier — batch slot closing',
      time: '20 min ago', type: NotificationType.followUp, isRead: false,
      routePath: '/follow-up-calls',
    ),
    const NotificationItem(
      id: '3', title: 'Task overdue',
      subtitle: 'Demo reminder — Divya Raveendran',
      time: '1 hr ago', type: NotificationType.task, isRead: false,
      routePath: '/dashboard?tab=tasks&filter=overdue',
    ),
    const NotificationItem(
      id: '4', title: 'Deal moved to Negotiation',
      subtitle: 'Corporate Batch — Fathima Z. • ₹3.4L',
      time: '3 hr ago', type: NotificationType.deal, isRead: true,
      routePath: '/deals',
    ),
    const NotificationItem(
      id: '5', title: 'Lead status updated',
      subtitle: 'Anjali Suresh → Interested',
      time: '5 hr ago', type: NotificationType.leadStatus, isRead: true,
      routePath: '/enquiry-details/6',
    ),
    const NotificationItem(
      id: '6', title: 'Mention in note',
      subtitle: '@you Admin tagged you on Sneha Pillai',
      time: 'Yesterday', type: NotificationType.mention, isRead: true,
      routePath: '/enquiry-details/2',
    ),
  ];

  @override
  Future<List<NotificationItem>> getNotifications() async {
    return List.unmodifiable(_mockNotifications);
  }

  @override
  Future<List<NotificationItem>> markAsRead(String id) async {
    final idx = _mockNotifications.indexWhere((n) => n.id == id);
    if (idx != -1) {
      _mockNotifications[idx] = _mockNotifications[idx].copyWith(isRead: true);
    }
    return List.unmodifiable(_mockNotifications);
  }

  @override
  Future<List<NotificationItem>> markAllAsRead() async {
    for (var i = 0; i < _mockNotifications.length; i++) {
      _mockNotifications[i] = _mockNotifications[i].copyWith(isRead: true);
    }
    return List.unmodifiable(_mockNotifications);
  }
}
