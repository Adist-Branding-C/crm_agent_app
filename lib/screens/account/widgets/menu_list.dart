import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/custom_card.dart';
import 'menu_divider.dart';
import 'menu_item_model.dart';

class MenuList extends StatelessWidget {
  final AccountProfile profile;

  const MenuList({super.key, required this.profile});

  static List<List<MenuItemModel>> _sections(AccountProfile p) => [
    [
      const MenuItemModel(icon: Icons.person_outline_rounded, title: 'Edit Profile', route: AppRoutes.editProfile),
      MenuItemModel(icon: Icons.show_chart_rounded, title: 'My Activity', route: AppRoutes.myActivity),
      MenuItemModel(icon: Icons.phone_outlined, title: 'Call Report', route: AppRoutes.callReport),
      const MenuItemModel(icon: Icons.fingerprint_rounded, title: 'Attendance History', route: AppRoutes.attendanceHistory),
      MenuItemModel(icon: Icons.notifications_none_rounded, title: 'Notifications', route: AppRoutes.notifications, badge: '${p.notificationCount}'),
    ],
    [
      const MenuItemModel(icon: Icons.lock_outline_rounded, title: 'Change Password', route: AppRoutes.changePassword),
      const MenuItemModel(icon: Icons.description_outlined, title: 'Help & Support'),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    const divider = MenuDivider();
    return Column(
      children: _sections(profile).map((items) => Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.lg),
        child: CustomCard(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Column(
            children: items
                .expand((item) => [item.toListItem(context), divider])
                .toList()..removeLast(),
          ),
        ),
      )).toList(),
    );
  }
}
