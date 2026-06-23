class AppTextScaler {
  AppTextScaler._();

  static const double referenceWidth = 375.0;
  static const double minScale = 0.8;
  static const double maxScale = 1.2;

  static double scale(double screenWidth, double baseFontSize) {
    final factor = (screenWidth / referenceWidth).clamp(minScale, maxScale);
    return baseFontSize * factor;
  }
}
