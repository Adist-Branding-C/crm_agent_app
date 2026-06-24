import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import '../../../bloc/notifications/notifications_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'notification_item_widget.dart';

String _notificationsErrorString(NotificationsFailure f) {
  switch (f) {
    case NotificationsFailure.load: return 'Failed to load notifications';
    case NotificationsFailure.unknown: return 'An error occurred';
  }
}

class NotificationsListBody extends StatelessWidget {
  const NotificationsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      buildWhen: (prev, curr) {
        if (prev is NotificationsLoaded && curr is NotificationsLoaded) {
          return prev.notifications.length != curr.notifications.length ||
              prev.unreadCount != curr.unreadCount;
        }
        return prev.runtimeType != curr.runtimeType;
      },
      builder: (context, state) {
        final list = state is NotificationsLoaded ? state.notifications : const [];
        return AsyncStateView(
          isLoading: state is NotificationsLoading || state is NotificationsInitial,
          hasError: state is NotificationsError,
          errorMessage: state is NotificationsError ? _notificationsErrorString(state.failure) : 'Error',
          onRetry: () => context.read<NotificationsBloc>().add(const LoadNotifications()),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            itemCount: list.length,
            itemBuilder: (context, index) => NotificationItemWidget(item: list[index]),
          ),
        );
      },
    );
  }
}
