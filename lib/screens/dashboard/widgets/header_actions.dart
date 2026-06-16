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
    final state = context.watch<AccountBloc>().state;
    final initials = state is AccountLoaded ? state.profile.initials : 'AN';

    final notifState = context.watch<NotificationsBloc>().state;
    final notifCount = notifState is NotificationsLoaded
        ? notifState.unreadCount.toString()
        : '3';

    return Row(
      children: [
        GestureDetector(
          onTap: () => context.push(AppRoutes.notificationsPath),
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
      onTap: () => context.push(AppRoutes.accountPath),
      child: UserAvatar(initials: initials, size: 40),
    );
  }
}
