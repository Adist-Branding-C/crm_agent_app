import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Base unit: 4px
  static const double xxs = 0;
  static const double xs = 1;
  static const double xs2 = 3;
  static const double sm = 5;
  static const double md = 9;
  static const double lg = 13;
  static const double xl = 17;
  static const double xxl = 21;
  static const double xxxl = 29;
  static const double huge = 37;
  static const double massive = 57;
  static const double ten = 7;
  static const double fourteen = 11;
  static const double hundred = 97;

  // Standard edge insets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets screenPaddingV = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets cardPaddingCompact = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static const EdgeInsets cardMarginList = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: xs2,
  );
  static const EdgeInsets headerPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static const EdgeInsets fabBottomPadding = EdgeInsets.only(
    left: xl,
    right: xl,
    top: lg,
    bottom: 74,
  );

  // Standard gap helpers
  static const SizedBox gapXxs = SizedBox(height: xxs);
  static const SizedBox gapXs = SizedBox(height: xs);
  static const SizedBox gapSm = SizedBox(height: sm);
  static const SizedBox gapMd = SizedBox(height: md);
  static const SizedBox gapLg = SizedBox(height: lg);
  static const SizedBox gapXl = SizedBox(height: xl);
  static const SizedBox gapXxl = SizedBox(height: xxl);
  static const SizedBox gapXxxl = SizedBox(height: xxxl);

  static const SizedBox gapWXxs = SizedBox(width: xxs);
  static const SizedBox gapWXs = SizedBox(width: xs);
  static const SizedBox gapWSm = SizedBox(width: sm);
  static const SizedBox gapWMd = SizedBox(width: md);
  static const SizedBox gapWLg = SizedBox(width: lg);
  static const SizedBox gapWXl = SizedBox(width: xl);
  static const SizedBox gapWXxl = SizedBox(width: xxl);
}
