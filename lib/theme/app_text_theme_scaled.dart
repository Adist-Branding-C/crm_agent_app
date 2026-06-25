import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'app_text_theme.dart';

/// Returns a [TextTheme] with all font sizes scaled dynamically.
TextTheme getScaledTextTheme(BuildContext context) {
  final textTheme = AppTextTheme.textTheme;
  return textTheme.copyWith(
    displayLarge: textTheme.displayLarge?.copyWith(
      fontSize: 32.s,
    ),
    displayMedium: textTheme.displayMedium?.copyWith(
      fontSize: 28.s,
    ),
    headlineLarge: textTheme.headlineLarge?.copyWith(
      fontSize: 26.s,
    ),
    headlineMedium: textTheme.headlineMedium?.copyWith(
      fontSize: 24.s,
    ),
    headlineSmall: textTheme.headlineSmall?.copyWith(
      fontSize: 20.s,
    ),
    titleLarge: textTheme.titleLarge?.copyWith(
      fontSize: 18.s,
    ),
    titleMedium: textTheme.titleMedium?.copyWith(
      fontSize: 16.s,
    ),
    titleSmall: textTheme.titleSmall?.copyWith(
      fontSize: 14.s,
    ),
    bodyLarge: textTheme.bodyLarge?.copyWith(
      fontSize: 16.s,
    ),
    bodyMedium: textTheme.bodyMedium?.copyWith(
      fontSize: 14.s,
    ),
    bodySmall: textTheme.bodySmall?.copyWith(
      fontSize: 12.s,
    ),
    labelLarge: textTheme.labelLarge?.copyWith(
      fontSize: 14.s,
    ),
    labelMedium: textTheme.labelMedium?.copyWith(
      fontSize: 12.s,
    ),
    labelSmall: textTheme.labelSmall?.copyWith(
      fontSize: 11.s,
    ),
  );
}
