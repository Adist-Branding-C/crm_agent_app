import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';
import '../../../data/settings_notifier.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/custom_button.dart';
import 'font_size_slider.dart';
import 'live_preview_card.dart';
import 'typeface_selector.dart';
import 'settings_disclaimer.dart';

class FontSettingsListBody extends StatelessWidget {
  final bool isFirstSetup;

  const FontSettingsListBody({super.key, required this.isFirstSetup});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>();
    final headerStyle = TextStyle(
      color: AppColors.textDark,
      fontWeight: FontWeight.bold,
      fontSize: 16.s,
    );

    return ListView(
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
        TypefaceSelector(settings: settings),
        const SettingsDisclaimer(),
        if (isFirstSetup) ...[
          AppSpacing.gapLg,
          CustomButton(
            text: 'Proceed to Dashboard',
            onPressed: settings.hasSavedSettings
                ? () => context.go(AppRoutes.dashboardPath)
                : null,
          ),
        ],
        AppSpacing.gapXl,
      ],
    );
  }
}
