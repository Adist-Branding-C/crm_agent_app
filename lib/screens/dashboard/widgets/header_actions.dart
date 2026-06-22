import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/account/account_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/user_avatar.dart';
import 'notification_bell.dart';

import '../../../bloc/notifications/notifications_bloc.dart';

/// Renders the action buttons (notifications and profile avatar) in the header.
class HeaderActions extends StatelessWidget {
  /// Creates a constant [HeaderActions].
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    final initials = context.select<AccountBloc, String>(
      (b) => b.state is AccountLoaded ? (b.state as AccountLoaded).profile.initials : 'AN',
    );
    final notifCount = context.select<NotificationsBloc, int>(
      (b) => b.state is NotificationsLoaded
          ? (b.state as NotificationsLoaded).unreadCount
          : 3,
    );

    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(AppRoutes.notifications),
          child: NotificationBell(count: notifCount),
        ),
        const SizedBox(width: 12),
        _AvatarButton(initials: initials),
      ],
    );
  }
}

class _AvatarButton extends StatelessWidget {
  final String initials;
  const _AvatarButton({required this.initials});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.account),
      child: UserAvatar(initials: initials, size: 40),
    );
  }
}
