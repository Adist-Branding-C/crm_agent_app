import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/notifications/notifications_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'notification_item_widget.dart';

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
          errorMessage: state is NotificationsError ? state.errorMessage : 'Error',
          onRetry: () => context.read<NotificationsBloc>().add(const LoadNotifications()),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: list.length,
            itemBuilder: (context, index) => NotificationItemWidget(item: list[index]),
          ),
        );
      },
    );
  }
}
