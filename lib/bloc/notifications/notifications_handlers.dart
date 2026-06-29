import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'notifications_bloc.dart';

/// Extension containing event handlers for [NotificationsBloc].
extension NotificationsHandlers on NotificationsBloc {
  Future<void> onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsLoading());
    try {
      final list = await notificationsRepository.getNotifications();
      emit(NotificationsLoaded(notifications: list));
    } catch (e, stackTrace) {
      developer.log(
        'Failed to load notifications',
        error: e,
        stackTrace: stackTrace,
        name: 'NotificationsBloc',
      );
      emit(const NotificationsError(failure: NotificationsFailure.load));
    }
  }

  Future<void> onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final currState = state;
    if (currState is NotificationsLoaded) {
      try {
        final updatedList = await notificationsRepository.markAsRead(
          event.notificationId,
        );
        emit(currState.copyWith(notifications: updatedList));
      } catch (e, stackTrace) {
        developer.log(
          'Failed to mark notification as read: ${event.notificationId}',
          error: e,
          stackTrace: stackTrace,
          name: 'NotificationsBloc',
        );
      }
    }
  }

  Future<void> onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final currState = state;
    if (currState is NotificationsLoaded) {
      try {
        final updatedList = await notificationsRepository.markAllAsRead();
        emit(currState.copyWith(notifications: updatedList));
      } catch (e, stackTrace) {
        developer.log(
          'Failed to mark all notifications as read',
          error: e,
          stackTrace: stackTrace,
          name: 'NotificationsBloc',
        );
      }
    }
  }
}
