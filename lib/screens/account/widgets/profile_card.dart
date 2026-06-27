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
          UserAvatar(initials: profile.initials, size: 65.r, fontSize: 30.s),
          AppSpacing.gapLg,
          Text(
            profile.name,
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 16.5.s,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            '${profile.role} · ${profile.branch}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 13.5.s),
          ),
          AppSpacing.gapLg,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileActionButton(
                icon: Icons.call_outlined,
                label: 'Call',
                textColor: AppColors.primaryColor,
                bgColor: AppColors.primaryColorLight,
              ),
              AppSpacing.gapWMd,
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
