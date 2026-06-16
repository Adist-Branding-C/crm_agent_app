import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/account/account_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../widgets/user_avatar.dart';

/// Renders the action buttons (notifications and profile avatar) in the header.
class HeaderActions extends StatelessWidget {
  /// Creates a constant [HeaderActions].
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountBloc>().state;
    final initials = state is AccountLoaded ? state.profile.initials : 'AN';
    final notifCount = state is AccountLoaded ? state.profile.notificationCount.toString() : '3';

    return Row(
      children: [
        _NotificationBell(count: notifCount),
        const SizedBox(width: 12),
        _AvatarButton(initials: initials),
      ],
    );
  }
}

class _NotificationBell extends StatelessWidget {
  final String count;
  const _NotificationBell({required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.cardShadow,
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textDark,
            size: 24,
          ),
        ),
        if (count != '0')
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.errorColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
