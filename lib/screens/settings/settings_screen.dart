import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';
import '../../router/app_routes.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/custom_card.dart';
import '../../data/settings_notifier.dart';

/// Screen widget displaying CRM settings options, including font customization.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>();

    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const ScreenHeader(
            title: 'Settings',
            showBackButton: true,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              children: [
                _buildSectionHeader(context, 'App Customization'),
                CustomCard(
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
                ),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Preferences'),
                CustomCard(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.notifications_none_rounded, size: 20.s, color: AppColors.textMuted),
                          title: Text(
                            'Push Notifications',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textDark,
                              fontSize: 15.s,
                            ),
                          ),
                          trailing: Switch.adaptive(
                            value: _notificationsEnabled,
                            onChanged: (val) {
                              setState(() {
                                _notificationsEnabled = val;
                              });
                            },
                          ),
                        ),
                        const Divider(height: 1, color: AppColors.borderLight),
                        ListTile(
                          leading: Icon(Icons.dark_mode_outlined, size: 20.s, color: AppColors.textMuted),
                          title: Text(
                            'Dark Mode',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textDark,
                              fontSize: 15.s,
                            ),
                          ),
                          trailing: Text(
                            'Light (Default)',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textMuted,
                              fontSize: 12.s,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Security & Account'),
                CustomCard(
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
                              fontSize: 15.s,
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
                ),
                AppSpacing.gapLg,
                const Center(
                  child: Text(
                    'CRM Agent App v1.0.0',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.textMuted,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
