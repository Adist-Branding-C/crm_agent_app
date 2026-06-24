import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/notifications/notifications_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: TextButton(
            onPressed: () =>
                context.read<NotificationsBloc>().add(const MarkAllAsRead()),
            child: const Text(
              'Mark all',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          padding: EdgeInsets.only(
            left: AppSpacing.xxl,
            right: AppSpacing.xxl,
            top: AppSpacing.lg,
            bottom: AppSpacing.sm,
          ),
        );
      },
    );
  }
}
