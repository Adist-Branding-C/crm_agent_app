import 'package:flutter/material.dart';
import 'currency_formatter.dart';
import 'text_scaler.dart';

extension ScaledText on BuildContext {
  double scaleFont(double baseSize) {
    return AppTextScaler.scale(MediaQuery.sizeOf(this).width, baseSize);
  }

  String formatCurrency(double value, {String symbol = '₹'}) {
    return value.toCurrencyFormat(symbol: symbol);
  }
}
