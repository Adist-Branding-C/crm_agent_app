import 'package:flutter/material.dart';

/// Notifier for the deals view toggle (pipeline vs list).
class DealsViewNotifier extends ValueNotifier<int> {
  DealsViewNotifier([super._value = 0]);

  void toggle(int index) {
    if (value == index) return;
    value = index;
  }
}
