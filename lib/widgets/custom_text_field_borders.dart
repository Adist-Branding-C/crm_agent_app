import 'package:flutter/material.dart';

/// Utility class to compile standard text field outline borders.
class CustomTextFieldBorders {
  CustomTextFieldBorders._();

  /// Builds a customized [OutlineInputBorder] with a specific color and radius.
  static OutlineInputBorder buildBorder({
    required Color color,
    required double radius,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }
}
