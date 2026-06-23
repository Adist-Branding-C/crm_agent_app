import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String? route;
  final String? badge;

  const MenuItemModel({required this.icon, required this.title, this.route, this.badge});

  Widget toListItem(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: ListTile(
      leading: Icon(icon, size: 22, color: AppColors.textMuted),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textDark)),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: AppColors.primaryColorLight, borderRadius: BorderRadius.circular(10)),
              child: Text(badge!, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.primaryColor)),
            )
          : const Icon(Icons.chevron_right_rounded, size: 20, color: AppColors.slate400),
      onTap: route != null ? () => context.pushNamed(route!) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      visualDensity: VisualDensity.compact,
    ),
  );
}
