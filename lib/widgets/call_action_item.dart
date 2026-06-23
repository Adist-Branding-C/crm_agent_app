import 'package:flutter/material.dart';
import '../theme.dart';
import 'call_action_tile.dart';

class CallActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback onTap;

  const CallActionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.borderLight, height: 1),
        CallActionTile(
          icon: icon,
          title: title,
          subtitle: subtitle,
          iconColor: iconColor,
          iconBgColor: iconBgColor,
          onTap: onTap,
        ),
      ],
    );
  }
}
