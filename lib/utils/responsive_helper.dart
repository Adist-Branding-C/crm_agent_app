import 'package:flutter/material.dart';

/// Helper class to provide responsive design utilities.
class ResponsiveHelper {
  /// Breakpoint for small mobile screens.
  static const double mobileSmallWidth = 360.0;

  /// Breakpoint for tablet screens.
  static const double tabletWidth = 600.0;

  /// Check if the screen width is small (e.g. mobile small).
  static bool isMobileSmall(BuildContext context) {
    return MediaQuery.sizeOf(context).width < mobileSmallWidth;
  }

  /// Check if the screen is a tablet/desktop.
  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= tabletWidth;
  }

  /// Resolve value based on responsive state.
  static T resolve<T>(
    BuildContext context, {
    required T mobile,
    T? mobileSmall,
    T? tablet,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tabletWidth && tablet != null) {
      return tablet;
    }
    if (width < mobileSmallWidth && mobileSmall != null) {
      return mobileSmall;
    }
    return mobile;
  }
}
