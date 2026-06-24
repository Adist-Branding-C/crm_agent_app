import 'package:flutter/material.dart';
import 'app_text_theme_base.dart';
import 'app_text_theme_scaled.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme => baseTextTheme;

  static TextTheme scaledTextTheme(BuildContext context) =>
      getScaledTextTheme(context);
}
