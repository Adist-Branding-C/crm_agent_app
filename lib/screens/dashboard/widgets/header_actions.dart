import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../widgets/user_avatar.dart';

/// Renders the action buttons (notifications and profile avatar) in the header.
class HeaderActions extends StatelessWidget {
  /// Creates a constant [HeaderActions].
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildNotificationBell(),
        const SizedBox(width: 12),
        _buildAvatar(context),
      ],
    );
  }

  Widget _buildNotificationBell() {
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
        Positioned(
          top: -2,
          right: -2,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.errorColor,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '3',
              style: TextStyle(
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

  Widget _buildAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.accountPath),
      child: const UserAvatar(initials: 'AN', size: 40),
    );
  }
}
