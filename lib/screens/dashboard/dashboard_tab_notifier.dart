import 'package:flutter/material.dart';

/// Shared notifier for the active dashboard tab index.
///
/// Decouples tab switching from GoRouter navigation, allowing widgets
/// deep in the tree (e.g. "View All" buttons) to change tabs without
/// a full route navigation.
class DashboardTabNotifier extends ChangeNotifier {
  int _currentIndex;

  DashboardTabNotifier({int initialIndex = 0}) : _currentIndex = initialIndex;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
