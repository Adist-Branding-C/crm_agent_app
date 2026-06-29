import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../data/settings_notifier.dart';
import '../../../router/app_routes.dart';

class AppCustomizationCard extends StatelessWidget {
  final SettingsNotifier settings;

  const AppCustomizationCard({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.text_fields_rounded, size: 20.s, color: AppColors.textMuted),
              title: Text(
                'Font Settings',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 15.s,
                ),
              ),
              subtitle: Text(
                '${settings.fontSize} size · ${settings.fontStyle} style',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 12.s,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
                size: 18.s,
                color: AppColors.slate400,
              ),
              onTap: () => context.pushNamed(AppRoutes.fontSettings),
            ),
          ],
        ),
      ),
    );
  }
}
