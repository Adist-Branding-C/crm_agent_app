import 'package:flutter/material.dart';
import 'text_scaler.dart';

extension ScaledText on BuildContext {
  double scaleFont(double baseSize) {
    return AppTextScaler.scale(MediaQuery.sizeOf(this).width, baseSize);
  }
}
