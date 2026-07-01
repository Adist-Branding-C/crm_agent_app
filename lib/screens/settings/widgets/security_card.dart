import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../router/app_routes.dart';

class SecurityCard extends StatelessWidget {
  const SecurityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.lock_outline_rounded, size: 20.s, color: AppColors.textMuted),
              title: Text(
                'Change Password',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textDark,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
                size: 18.s,
                color: AppColors.slate400,
              ),
              onTap: () => context.pushNamed(AppRoutes.changePassword),
            ),
          ],
        ),
      ),
    );
  }
}
