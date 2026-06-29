import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_theme_base.dart';
import 'app_text_theme_scaled.dart';

/// Helper to get a modified TextTheme for different font styles.
TextTheme getCustomTextTheme(TextTheme base, String styleName) {
  TextTheme theme;
  double letterSpacingDelta = 0.0;
  double wordSpacingDelta = 0.0;

  switch (styleName) {
    // Google Fonts resolutions
    case 'Roboto':
      theme = GoogleFonts.getTextTheme('Roboto', base);
      break;
    case 'Inter':
      theme = GoogleFonts.getTextTheme('Inter', base);
      break;
    case 'Poppins':
      theme = GoogleFonts.getTextTheme('Poppins', base);
      break;
    case 'Open Sans':
      theme = GoogleFonts.getTextTheme('Open Sans', base);
      break;
    case 'Lato':
      theme = GoogleFonts.getTextTheme('Lato', base);
      break;
    case 'Montserrat':
      theme = GoogleFonts.getTextTheme('Montserrat', base);
      break;
    case 'Nunito':
      theme = GoogleFonts.getTextTheme('Nunito', base);
      break;
    case 'Quicksand':
    case 'Rounded':
      theme = GoogleFonts.getTextTheme('Quicksand', base);
      break;
    case 'DM Sans':
      theme = GoogleFonts.getTextTheme('DM Sans', base);
      break;
    case 'Manrope':
      theme = GoogleFonts.getTextTheme('Manrope', base);
      break;
    case 'Space Grotesk':
      theme = GoogleFonts.getTextTheme('Space Grotesk', base);
      break;
    case 'Work Sans':
      theme = GoogleFonts.getTextTheme('Work Sans', base);
      break;
    case 'Fira Sans':
      theme = GoogleFonts.getTextTheme('Fira Sans', base);
      break;
    case 'Oswald':
      theme = GoogleFonts.getTextTheme('Oswald', base);
      break;
    case 'Raleway':
      theme = GoogleFonts.getTextTheme('Raleway', base);
      break;
    case 'Ubuntu':
      theme = GoogleFonts.getTextTheme('Ubuntu', base);
      break;
    case 'Merriweather':
      theme = GoogleFonts.getTextTheme('Merriweather', base);
      break;
    case 'Playfair Display':
      theme = GoogleFonts.getTextTheme('Playfair Display', base);
      break;

    // Local system/asset font resolutions
    case 'Google Sans':
      theme = base.apply(fontFamily: 'Google Sans');
      break;
    case 'SF Pro':
    case 'San Francisco':
      theme = base.apply(fontFamily: '.SF Pro Text');
      break;
    case 'Satoshi':
      theme = base.apply(fontFamily: 'Satoshi');
      break;
    case 'Helvetica Neue':
      theme = base.apply(fontFamily: 'Helvetica Neue');
      break;
    case 'Serif':
      theme = base.apply(fontFamily: 'Georgia');
      break;
    case 'Monospace':
      theme = base.apply(fontFamily: 'Courier');
      break;
    case 'Modern':
      theme = base.apply(fontFamily: 'Helvetica');
      break;
    case 'Elegant':
      theme = base.apply(fontFamily: 'Palatino');
      break;
    case 'Playful':
      theme = base.apply(fontFamily: 'Chalkboard SE');
      break;
    case 'Dyslexic-Friendly':
      theme = base.apply(fontFamily: 'Arial');
      letterSpacingDelta = 1.2;
      wordSpacingDelta = 2.0;
      break;
    case 'Futuristic':
      theme = base.apply(fontFamily: 'Trebuchet MS');
      break;
    case 'Console':
      theme = base.apply(fontFamily: 'Consolas');
      break;
    case 'Classic':
      theme = base.apply(fontFamily: 'Times New Roman');
      break;
    case 'System':
    case 'Default':
    default:
      theme = base;
  }
  if (letterSpacingDelta != 0.0 || wordSpacingDelta != 0.0) {
    theme = TextTheme(
      displayLarge: theme.displayLarge?.copyWith(letterSpacing: (theme.displayLarge?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      displayMedium: theme.displayMedium?.copyWith(letterSpacing: (theme.displayMedium?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      displaySmall: theme.displaySmall?.copyWith(letterSpacing: (theme.displaySmall?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      headlineLarge: theme.headlineLarge?.copyWith(letterSpacing: (theme.headlineLarge?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      headlineMedium: theme.headlineMedium?.copyWith(letterSpacing: (theme.headlineMedium?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      headlineSmall: theme.headlineSmall?.copyWith(letterSpacing: (theme.headlineSmall?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      titleLarge: theme.titleLarge?.copyWith(letterSpacing: (theme.titleLarge?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      titleMedium: theme.titleMedium?.copyWith(letterSpacing: (theme.titleMedium?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      titleSmall: theme.titleSmall?.copyWith(letterSpacing: (theme.titleSmall?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      bodyLarge: theme.bodyLarge?.copyWith(letterSpacing: (theme.bodyLarge?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      bodyMedium: theme.bodyMedium?.copyWith(letterSpacing: (theme.bodyMedium?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      bodySmall: theme.bodySmall?.copyWith(letterSpacing: (theme.bodySmall?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      labelLarge: theme.labelLarge?.copyWith(letterSpacing: (theme.labelLarge?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      labelMedium: theme.labelMedium?.copyWith(letterSpacing: (theme.labelMedium?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
      labelSmall: theme.labelSmall?.copyWith(letterSpacing: (theme.labelSmall?.letterSpacing ?? 0) + letterSpacingDelta, wordSpacing: wordSpacingDelta),
    );
  }
  return theme;
}

class AppTextTheme {
  AppTextTheme._();

  static TextTheme getTheme({String fontStyle = 'Default'}) =>
      getCustomTextTheme(baseTextTheme, fontStyle);

  static TextTheme get textTheme => baseTextTheme;

  static TextTheme scaledTextTheme(BuildContext context, {String fontStyle = 'Default'}) =>
      getScaledTextTheme(context, fontStyle: fontStyle);
}
