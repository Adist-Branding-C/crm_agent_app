import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../data/settings_notifier.dart';
import 'widgets/app_customization_card.dart';
import 'widgets/preferences_card.dart';
import 'widgets/security_card.dart';

/// Screen widget displaying CRM settings options, including font customization.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>();

    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Settings',
            showBackButton: true,
            padding: EdgeInsets.fromLTRB(17.0.w, 20.0.h, 17.0.w, 13.0.h),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 8.0.h,
              ),
              children: [
                const _SettingsSectionHeader(title: 'App Customization'),
                AppCustomizationCard(settings: settings),
                AppSpacing.gapLg,
                const _SettingsSectionHeader(title: 'Preferences'),
                const PreferencesCard(),
                AppSpacing.gapLg,
                const _SettingsSectionHeader(title: 'Security & Account'),
                const SecurityCard(),
                AppSpacing.gapLg,
                const Center(
                  child: Text(
                    'CRM Agent App v1.0.0',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSectionHeader extends StatelessWidget {
  final String title;
  const _SettingsSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
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
