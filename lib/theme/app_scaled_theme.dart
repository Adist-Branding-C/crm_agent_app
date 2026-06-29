import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/settings_notifier.dart';
import '../theme.dart';
import 'app_text_theme.dart';
import 'app_input_theme.dart';
import 'app_button_theme.dart';

ThemeData getScaledLightTheme(BuildContext context) {
  final settings = Provider.of<SettingsNotifier>(context);
  final base = AppTheme.lightTheme(fontStyle: settings.fontStyle);
  return base.copyWith(
    textTheme: AppTextTheme.scaledTextTheme(context, fontStyle: settings.fontStyle),
    appBarTheme: base.appBarTheme.copyWith(
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20.s,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: AppInputTheme.scaledInputDecorationTheme(context),
    elevatedButtonTheme: AppButtonTheme.scaledElevatedButtonTheme(context),
  );
}
