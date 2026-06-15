import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';
import 'menu_item_widget.dart';

/// Renders the grouped list of profile and settings options.
class MenuList extends StatelessWidget {
  final AccountProfile profile;

  /// Creates a [MenuList].
  const MenuList({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: AppColors.borderLight,
    );

    return Column(
      children: [
        CustomCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              const MenuItemWidget(
                icon: Icons.person_outline_rounded,
                title: 'Edit Profile',
              ),
              divider,
              const MenuItemWidget(
                icon: Icons.show_chart_rounded,
                title: 'My Activity',
              ),
              divider,
              const MenuItemWidget(
                icon: Icons.phone_outlined,
                title: 'Call Report',
              ),
              divider,
              const MenuItemWidget(
                icon: Icons.fingerprint_rounded,
                title: 'Attendance History',
              ),
              divider,
              MenuItemWidget(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                badge: '${profile.notificationCount}',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CustomCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              const MenuItemWidget(
                icon: Icons.settings_outlined,
                title: 'Settings',
              ),
              divider,
              const MenuItemWidget(
                icon: Icons.description_outlined,
                title: 'Help & Support',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
