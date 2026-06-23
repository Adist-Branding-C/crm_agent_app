import 'package:flutter/material.dart';
import '../theme.dart';
import 'app_text_theme.dart';
import 'app_input_theme.dart';
import 'app_button_theme.dart';
import '../../utils/text_scaler.dart';

ThemeData getScaledLightTheme(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  final base = AppTheme.lightTheme;
  return base.copyWith(
    textTheme: AppTextTheme.scaledTextTheme(context),
    appBarTheme: base.appBarTheme.copyWith(
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: AppTextScaler.scale(w, 20),
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: AppInputTheme.scaledInputDecorationTheme(context),
    elevatedButtonTheme: AppButtonTheme.scaledElevatedButtonTheme(context),
  );
}
