import '../models/notification_models.dart';

/// Repository interface managing Notifications.
abstract class NotificationsRepository {
  /// Fetches the list of all notifications.
  Future<List<NotificationItem>> getNotifications();

  /// Marks a specific notification as read by ID.
  Future<List<NotificationItem>> markAsRead(String id);

  /// Marks all notifications as read.
  Future<List<NotificationItem>> markAllAsRead();
}
