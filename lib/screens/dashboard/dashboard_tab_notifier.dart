import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardTabNotifier extends ChangeNotifier {
  int _currentIndex;
  static const _key = 'dashboard_tab_index';

  DashboardTabNotifier({int initialIndex = 0}) : _currentIndex = initialIndex;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
    _persistIndex();
  }

  Future<void> _persistIndex() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_key, _currentIndex);
    } catch (_) {}
  }

  static Future<int> loadSavedIndex({int defaultIndex = 0}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_key) ?? defaultIndex;
    } catch (_) {
      return defaultIndex;
    }
  }
}
