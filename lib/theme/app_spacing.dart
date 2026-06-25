import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';

class AppSpacing {
  AppSpacing._();

  // Base unit: 4px
  static double get xxs => 1.w;
  static double get xs => 2.w;
  static double get xs2 => 4.w;
  static double get sm => 6.w;
  static double get md => 9.w;
  static double get lg => 13.w;
  static double get xl => 17.w;
  static double get xxl => 21.w;
  static double get xxxl => 29.w;
  static double get huge => 37.w;
  static double get massive => 57.w;
  static double get ten => 7.w;
  static double get fourteen => 11.w;
  static double get hundred => 97.w;

  // Standard edge insets
  static EdgeInsets get screenPadding => xl.ph;
  static EdgeInsets get screenPaddingV => EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static EdgeInsets get cardPadding => lg.p;
  static EdgeInsets get cardPaddingCompact => EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static EdgeInsets get cardMarginList => EdgeInsets.symmetric(
    horizontal: xl,
    vertical: xs2,
  );
  static EdgeInsets get headerPadding => EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static EdgeInsets get fabBottomPadding => EdgeInsets.only(
    left: xl,
    right: xl,
    top: lg,
    bottom: 74.h,
  );

  // Standard gap helpers
  static SizedBox get gapXxs => SizedBox(height: 1.h);
  static SizedBox get gapXs => SizedBox(height: 2.h);
  static SizedBox get gapSm => SizedBox(height: 6.h);
  static SizedBox get gapMd => SizedBox(height: 9.h);
  static SizedBox get gapLg => SizedBox(height: 13.h);
  static SizedBox get gapXl => SizedBox(height: 17.h);
  static SizedBox get gapXxl => SizedBox(height: 21.h);
  static SizedBox get gapXxxl => SizedBox(height: 29.h);

  static SizedBox get gapWXxs => SizedBox(width: 1.w);
  static SizedBox get gapWXs => SizedBox(width: 2.w);
  static SizedBox get gapWSm => SizedBox(width: 6.w);
  static SizedBox get gapWMd => SizedBox(width: 9.w);
  static SizedBox get gapWLg => SizedBox(width: 13.w);
  static SizedBox get gapWXl => SizedBox(width: 17.w);
  static SizedBox get gapWXxl => SizedBox(width: 21.w);
}
