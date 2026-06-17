part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object?> get props => [];
}

class NotificationsInitial extends NotificationsState {
  const NotificationsInitial();
}

class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();
}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationItem> notifications;

  const NotificationsLoaded({required this.notifications});

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  NotificationsLoaded copyWith({List<NotificationItem>? notifications}) {
    return NotificationsLoaded(
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props => [notifications];
}

enum NotificationsFailure { load, unknown }

class NotificationsError extends NotificationsState {
  final NotificationsFailure failure;
  const NotificationsError({required this.failure});

  String get errorMessage {
    switch (failure) {
      case NotificationsFailure.load: return 'Failed to load notifications';
      case NotificationsFailure.unknown: return 'An error occurred';
    }
  }

  @override
  List<Object?> get props => [failure];
}
