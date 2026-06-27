import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String? route;
  final String? badge;

  const MenuItemModel({
    required this.icon,
    required this.title,
    this.route,
    this.badge,
  });

  Widget toListItem(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: ListTile(
      leading: Icon(icon, size: 20.s, color: AppColors.textMuted),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.textDark,fontSize: 15.s),
      ),
      trailing: badge != null
          ? Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                badge!,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.primaryColor),
              ),
            )
          : Icon(
              Icons.chevron_right_rounded,
              size: 18.s,
              color: AppColors.slate400,
            ),
      onTap: route != null ? () => context.pushNamed(route!) : null,
      contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      visualDensity: VisualDensity.compact,
    ),
  );
}
