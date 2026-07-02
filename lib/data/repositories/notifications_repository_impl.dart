import '../models/notification_models.dart';
import '../mocks/mock_notifications.dart';
import 'notifications_repository.dart';

/// Concrete implementation of [NotificationsRepository] returning mock data.
class NotificationsRepositoryImpl implements NotificationsRepository {
  final List<NotificationItem> _mockNotifications = List.from(mockNotificationsList);

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
