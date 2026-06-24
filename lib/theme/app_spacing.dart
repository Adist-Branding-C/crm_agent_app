import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Base unit: 4px
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;
  static const double massive = 60;

  // Standard edge insets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: xxl);
  static const EdgeInsets screenPaddingV = EdgeInsets.symmetric(horizontal: xxl, vertical: lg);
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets cardPaddingCompact = EdgeInsets.symmetric(horizontal: lg, vertical: md);
  static const EdgeInsets cardMarginList = EdgeInsets.symmetric(horizontal: xxl, vertical: 6);
  static const EdgeInsets headerPadding = EdgeInsets.symmetric(horizontal: xxl, vertical: lg);

  // Standard gap helpers
  static const SizedBox gapXs = SizedBox(height: xs);
  static const SizedBox gapSm = SizedBox(height: sm);
  static const SizedBox gapMd = SizedBox(height: md);
  static const SizedBox gapLg = SizedBox(height: lg);
  static const SizedBox gapXl = SizedBox(height: xl);
  static const SizedBox gapXxl = SizedBox(height: xxl);

  static const SizedBox gapWXs = SizedBox(width: xs);
  static const SizedBox gapWSm = SizedBox(width: sm);
  static const SizedBox gapWMd = SizedBox(width: md);
  static const SizedBox gapWLg = SizedBox(width: lg);
  static const SizedBox gapWXl = SizedBox(width: xl);
}
