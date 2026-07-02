import 'package:flutter/material.dart';
import '../../../data/settings_notifier.dart';
import '../models/font_style_presets.dart';
import 'typeface_card.dart';

class TypefaceSelector extends StatelessWidget {
  final SettingsNotifier settings;

  const TypefaceSelector({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: typefacePresets.map((preset) {
        final isSelected =
            (preset.styleValue == 'System' &&
                settings.fontStyle == 'Default') ||
            settings.fontStyle == preset.styleValue;
        return TypefaceCard(
          title: preset.title,
          subtitle: preset.subtitle,
          styleValue: preset.styleValue,
          isSelected: isSelected,
          onTap: () => settings.setFontStyle(preset.styleValue),
        );
      }).toList(),
    );
  }
}
