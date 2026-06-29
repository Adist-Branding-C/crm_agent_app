import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_theme_base.dart';
import 'app_text_theme_scaled.dart';
import 'app_text_theme_spacing.dart';

const _googleFonts = {
  'Roboto', 'Inter', 'Poppins', 'Open Sans', 'Lato', 'Montserrat',
  'Nunito', 'DM Sans', 'Manrope', 'Space Grotesk', 'Work Sans',
  'Fira Sans', 'Oswald', 'Raleway', 'Ubuntu', 'Merriweather', 'Playfair Display'
};

const _localFonts = {
  'Google Sans': 'Google Sans',
  'SF Pro': '.SF Pro Text',
  'San Francisco': '.SF Pro Text',
  'Satoshi': 'Satoshi',
  'Helvetica Neue': 'Helvetica Neue',
  'Serif': 'Georgia',
  'Monospace': 'Courier',
  'Modern': 'Helvetica',
  'Elegant': 'Palatino',
  'Playful': 'Chalkboard SE',
  'Dyslexic-Friendly': 'Arial',
  'Futuristic': 'Trebuchet MS',
  'Console': 'Consolas',
  'Classic': 'Times New Roman',
};

TextTheme getCustomTextTheme(TextTheme base, String styleName) {
  TextTheme theme;
  double letterSpacingDelta = 0.0;
  double wordSpacingDelta = 0.0;

  if (styleName == 'Rounded' || styleName == 'Quicksand') {
    theme = GoogleFonts.getTextTheme('Quicksand', base);
  } else if (_googleFonts.contains(styleName)) {
    theme = GoogleFonts.getTextTheme(styleName, base);
  } else if (_localFonts.containsKey(styleName)) {
    theme = base.apply(fontFamily: _localFonts[styleName]);
    if (styleName == 'Dyslexic-Friendly') {
      letterSpacingDelta = 1.2;
      wordSpacingDelta = 2.0;
    }
  } else {
    theme = base;
  }

  if (letterSpacingDelta != 0.0 || wordSpacingDelta != 0.0) {
    theme = applyTextThemeSpacing(theme, letterSpacingDelta, wordSpacingDelta);
  }
  return theme;
}

class AppTextTheme {
  AppTextTheme._();
  static TextTheme getTheme({String fontStyle = 'Default'}) => getCustomTextTheme(baseTextTheme, fontStyle);
  static TextTheme get textTheme => baseTextTheme;
  static TextTheme scaledTextTheme(BuildContext context, {String fontStyle = 'Default'}) =>
      getScaledTextTheme(context, fontStyle: fontStyle);
}
