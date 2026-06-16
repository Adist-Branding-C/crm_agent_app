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

class NotificationsError extends NotificationsState {
  final String errorMessage;
  const NotificationsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
