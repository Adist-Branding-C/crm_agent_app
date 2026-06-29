import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/custom_button.dart';
import '../../data/settings_notifier.dart';
import '../../router/app_routes.dart';
import 'widgets/font_size_slider.dart';
import 'widgets/live_preview_card.dart';
import 'widgets/typeface_card.dart';
import 'widgets/settings_disclaimer.dart';
import 'models/font_style_presets.dart';

class FontSettingsScreen extends StatefulWidget {
  const FontSettingsScreen({super.key});

  @override
  State<FontSettingsScreen> createState() => _FontSettingsScreenState();
}

class _FontSettingsScreenState extends State<FontSettingsScreen> {
  bool _isFirstSetup = false;

  @override
  void initState() {
    super.initState();
    final settings = Provider.of<SettingsNotifier>(context, listen: false);
    _isFirstSetup = !settings.hasSavedSettings;
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>();
    final headerStyle = TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 16.s);

    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Font Settings',
            subtitleWidget: Text(
              'Text size & typeface',
              style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w500, fontSize: 12.s),
            ),
            showBackButton: !_isFirstSetup,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              children: [
                const LivePreviewCard(),
                AppSpacing.gapLg,
                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                  child: Text('Text size', style: headerStyle),
                ),
                FontSizeSlider(
                  selectedSize: settings.fontSize,
                  onSelected: settings.setFontSize,
                ),
                AppSpacing.gapLg,
                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                  child: Text('Typeface', style: headerStyle),
                ),
                ...typefacePresets.map((preset) {
                  final isSelected = (preset.styleValue == 'System' && settings.fontStyle == 'Default') ||
                      settings.fontStyle == preset.styleValue;
                  return TypefaceCard(
                    title: preset.title,
                    subtitle: preset.subtitle,
                    styleValue: preset.styleValue,
                    isSelected: isSelected,
                    onTap: () => settings.setFontStyle(preset.styleValue),
                  );
                }),
                const SettingsDisclaimer(),
                if (_isFirstSetup) ...[
                  AppSpacing.gapLg,
                  CustomButton(
                    text: 'Proceed to Dashboard',
                    onPressed: settings.hasSavedSettings ? () => context.go(AppRoutes.dashboardPath) : null,
                  ),
                ],
                AppSpacing.gapXl,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
