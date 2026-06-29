import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/notifications_repository.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';
import 'notifications_handlers.dart';

export 'notifications_event.dart';
export 'notifications_state.dart';

/// BLoC managing states and events for Notifications.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsBloc({required this.notificationsRepository})
    : super(const NotificationsInitial()) {
    on<LoadNotifications>(onLoadNotifications);
    on<MarkAsRead>(onMarkAsRead);
    on<MarkAllAsRead>(onMarkAllAsRead);
  }
}
