import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';
import 'profile_action_button.dart';

/// Renders the primary profile card widget.
class ProfileCard extends StatelessWidget {
  final AccountProfile profile;

  /// Creates a [ProfileCard].
  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: AppSpacing.cardPadding,
      child: Column(
        children: [
          UserAvatar(initials: profile.initials, size: 80, fontSize: 28),
          const SizedBox(height: 16),
          Text(
            profile.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            '${profile.role} · ${profile.branch}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileActionButton(
                icon: Icons.call_outlined,
                label: 'Call',
                textColor: AppColors.primaryColor,
                bgColor: AppColors.primaryColorLight,
              ),
              const SizedBox(width: 12),
              const ProfileActionButton(
                icon: Icons.email_outlined,
                label: 'Email',
                textColor: AppColors.textDark,
                bgColor: AppColors.slate100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
