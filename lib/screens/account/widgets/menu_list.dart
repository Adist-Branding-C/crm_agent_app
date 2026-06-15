import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';

/// Renders the grouped list of profile and settings options.
class MenuList extends StatelessWidget {
  final AccountProfile profile;

  /// Creates a [MenuList].
  const MenuList({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              _buildMenuItem(Icons.person_outline_rounded, 'Edit Profile'),
              _buildDivider(),
              _buildMenuItem(Icons.show_chart_rounded, 'My Activity'),
              _buildDivider(),
              _buildMenuItem(Icons.phone_outlined, 'Call Report'),
              _buildDivider(),
              _buildMenuItem(Icons.fingerprint_rounded, 'Attendance History'),
              _buildDivider(),
              _buildMenuItem(Icons.notifications_none_rounded, 'Notifications',
                  badge: '${profile.notificationCount}'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CustomCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              _buildMenuItem(Icons.settings_outlined, 'Settings'),
              _buildDivider(),
              _buildMenuItem(Icons.description_outlined, 'Help & Support'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {String? badge}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: AppColors.textMuted),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ),
            if (badge != null) ...[
              Text(
                badge,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(Icons.chevron_right_rounded,
                size: 20, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
        height: 1, indent: 16, endIndent: 16, color: AppColors.borderLight);
  }
}
