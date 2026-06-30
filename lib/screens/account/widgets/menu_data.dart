import 'package:flutter/material.dart';
import '../../../bloc/account/account_models.dart';
import '../../../router/app_routes.dart';
import 'menu_item_model.dart';

/// Helper class that defines the menu structure for the profile page.
class MenuData {
  MenuData._();

  /// Builds list sections of profile menu items based on the profile data.
  static List<List<MenuItemModel>> buildSections(AccountProfile p) => [
    [
      const MenuItemModel(
        icon: Icons.person_outline_rounded,
        title: 'Edit Profile',
        route: AppRoutes.editProfile,
      ),
      MenuItemModel(
        icon: Icons.show_chart_rounded,
        title: 'My Activity',
        route: AppRoutes.myActivity,
      ),
      MenuItemModel(
        icon: Icons.phone_outlined,
        title: 'Call Report',
        route: AppRoutes.callReport,
      ),
      const MenuItemModel(
        icon: Icons.settings_outlined,
        title: 'Settings',
        route: AppRoutes.settings,
      ),
      const MenuItemModel(
        icon: Icons.fingerprint_rounded,
        title: 'Attendance History',
        route: AppRoutes.attendanceHistory,
      ),
      MenuItemModel(
        icon: Icons.notifications_none_rounded,
        title: 'Notifications',
        route: AppRoutes.notifications,
        badge: '${p.notificationCount}',
      ),
    ],
    [
      const MenuItemModel(
        icon: Icons.lock_outline_rounded,
        title: 'Change Password',
        route: AppRoutes.changePassword,
      ),
      const MenuItemModel(
        icon: Icons.description_outlined,
        title: 'Help & Support',
      ),
      const MenuItemModel(
        icon: Icons.privacy_tip_outlined,
        title: 'Privacy Policy',
        route: AppRoutes.privacyPolicy,
      ),
    ],
  ];
}
