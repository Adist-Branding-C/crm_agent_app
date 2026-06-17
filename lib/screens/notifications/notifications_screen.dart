import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/notifications/notifications_bloc.dart';
import '../../theme.dart';
import '../../widgets/async_state_view.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/notification_item_widget.dart';

/// Renders the scrollable notifications screen with mark-all capability.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Expanded(child: _NotificationsListBody()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      buildWhen: (prev, curr) {
        if (prev is NotificationsLoaded && curr is NotificationsLoaded) {
          return prev.unreadCount != curr.unreadCount;
        }
        return prev.runtimeType != curr.runtimeType;
      },
      builder: (context, state) {
        final count = state is NotificationsLoaded ? state.unreadCount : 0;
        return ScreenHeader(
          title: 'Notifications',
          showBackButton: true,
          subtitleWidget: Text(
            '$count unread',
            style: const TextStyle(fontSize: 14, color: AppColors.textMuted, fontWeight: FontWeight.w600),
          ),
          actions: TextButton(
            onPressed: () => context.read<NotificationsBloc>().add(const MarkAllAsRead()),
            child: const Text('Mark all', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
          ),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        );
      },
    );
  }
}

class _NotificationsListBody extends StatelessWidget {
  const _NotificationsListBody();

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
