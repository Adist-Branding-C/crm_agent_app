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
                _buildSectionHeader(context, 'App Customization'),
                AppCustomizationCard(settings: settings),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Preferences'),
                const PreferencesCard(),
                AppSpacing.gapLg,
                _buildSectionHeader(context, 'Security & Account'),
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
