import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/notifications_repository.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

export 'notifications_event.dart';
export 'notifications_state.dart';

/// BLoC managing states and events for Notifications.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsBloc({required this.notificationsRepository})
      : super(const NotificationsInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkAsRead>(_onMarkAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsLoading());
    try {
      final list = await notificationsRepository.getNotifications();
      emit(NotificationsLoaded(notifications: list));
    } catch (_) {
      emit(const NotificationsError(failure: NotificationsFailure.load));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final currState = state;
    if (currState is NotificationsLoaded) {
      try {
        final updatedList =
            await notificationsRepository.markAsRead(event.notificationId);
        emit(currState.copyWith(notifications: updatedList));
      } catch (_) {}
    }
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final currState = state;
    if (currState is NotificationsLoaded) {
      try {
        final updatedList = await notificationsRepository.markAllAsRead();
        emit(currState.copyWith(notifications: updatedList));
      } catch (_) {}
    }
  }
}
