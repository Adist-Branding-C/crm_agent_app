import 'package:flutter/material.dart';

/// Applies letter and word spacing adjustments to a [TextTheme].
TextTheme applyTextThemeSpacing(TextTheme theme, double ls, double ws) {
  return TextTheme(
    displayLarge: theme.displayLarge?.copyWith(letterSpacing: (theme.displayLarge?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    displayMedium: theme.displayMedium?.copyWith(letterSpacing: (theme.displayMedium?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    displaySmall: theme.displaySmall?.copyWith(letterSpacing: (theme.displaySmall?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    headlineLarge: theme.headlineLarge?.copyWith(letterSpacing: (theme.headlineLarge?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    headlineMedium: theme.headlineMedium?.copyWith(letterSpacing: (theme.headlineMedium?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    headlineSmall: theme.headlineSmall?.copyWith(letterSpacing: (theme.headlineSmall?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    titleLarge: theme.titleLarge?.copyWith(letterSpacing: (theme.titleLarge?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    titleMedium: theme.titleMedium?.copyWith(letterSpacing: (theme.titleMedium?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    titleSmall: theme.titleSmall?.copyWith(letterSpacing: (theme.titleSmall?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    bodyLarge: theme.bodyLarge?.copyWith(letterSpacing: (theme.bodyLarge?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    bodyMedium: theme.bodyMedium?.copyWith(letterSpacing: (theme.bodyMedium?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    bodySmall: theme.bodySmall?.copyWith(letterSpacing: (theme.bodySmall?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    labelLarge: theme.labelLarge?.copyWith(letterSpacing: (theme.labelLarge?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    labelMedium: theme.labelMedium?.copyWith(letterSpacing: (theme.labelMedium?.letterSpacing ?? 0) + ls, wordSpacing: ws),
    labelSmall: theme.labelSmall?.copyWith(letterSpacing: (theme.labelSmall?.letterSpacing ?? 0) + ls, wordSpacing: ws),
  );
}
