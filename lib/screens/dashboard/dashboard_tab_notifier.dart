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
    SharedPreferences.getInstance().then((prefs) => prefs.setInt(_key, index));
  }

  static Future<int> loadSavedIndex({int defaultIndex = 0}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? defaultIndex;
  }
}
