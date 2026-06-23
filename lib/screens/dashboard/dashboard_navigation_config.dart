import 'package:flutter/material.dart';
import '../leads/leads_screen.dart';
import '../tasks/tasks_screen.dart';
import '../search/search_screen.dart';
import 'models/dashboard_navigation_item.dart';
import 'widgets/dashboard_body.dart';

class DashboardNavigationConfig {
  DashboardNavigationConfig._();

  /// Auto-generated registry from items list. Adding a new tab to [items]
  /// automatically adds its label → index mapping here (OCP-compliant).
  static Map<String, int> get tabRegistry {
    final map = <String, int>{};
    for (var i = 0; i < items.length; i++) {
      map[items[i].label.toLowerCase()] = i;
    }
    return map;
  }

  static final List<DashboardNavigationItem> items = [
    const DashboardNavigationItem(
      label: 'Dashboard',
      icon: Icon(Icons.home_outlined, size: 22),
      activeIcon: Icon(Icons.home_rounded, size: 22),
      body: DashboardBody(),
    ),
    const DashboardNavigationItem(
      label: 'Leads',
      icon: Icon(Icons.people_outline_rounded, size: 22),
      activeIcon: Icon(Icons.people_rounded, size: 22),
      body: LeadsScreen(),
    ),
    const DashboardNavigationItem(
      label: 'Tasks',
      icon: Icon(Icons.check_box_outlined, size: 22),
      activeIcon: Icon(Icons.check_box_rounded, size: 22),
      body: TasksScreen(),
    ),
    const DashboardNavigationItem(
      label: 'Search',
      icon: Icon(Icons.search_rounded, size: 22),
      body: SearchScreen(),
    ),
  ];
}
