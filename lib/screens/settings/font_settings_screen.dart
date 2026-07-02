import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../data/settings_notifier.dart';
import 'widgets/font_settings_list_body.dart';

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
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Font Settings',
            padding: EdgeInsets.fromLTRB(17.0.w, 20.0.h, 17.0.w, 13.0.h),
            subtitleWidget: Text(
              'Text size & typeface',
              style: TextStyle(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
                fontSize: 12.s,
              ),
            ),
            showBackButton: !_isFirstSetup,
          ),
          Expanded(
            child: FontSettingsListBody(isFirstSetup: _isFirstSetup),
          ),
        ],
      ),
    );
  }
}
