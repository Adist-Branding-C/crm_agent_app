import 'package:flutter/material.dart';
import '../../theme.dart';
import '../leads/leads_screen.dart';
import '../tasks/tasks_screen.dart';
import 'models/dashboard_navigation_item.dart';
import 'widgets/dashboard_body.dart';

/// Central configuration for Dashboard navigation tabs.
///
/// By separating the tab definitions into this config, the system adheres
/// to the Open/Closed Principle: new tabs can be added by editing this configuration
/// without altering the dashboard screen and layout components.
class DashboardNavigationConfig {
  DashboardNavigationConfig._();

  /// Defines the list of tabs displayed in the dashboard navigation.
  static final List<DashboardNavigationItem> items = [
    const DashboardNavigationItem(
      label: 'Dashboard',
      icon: Icon(Icons.home_outlined, size: 22),
      activeIcon: Icon(Icons.home_rounded, size: 22),
      bodyBuilder: _buildDashboardBody,
    ),
    const DashboardNavigationItem(
      label: 'Leads',
      icon: Icon(Icons.people_outline_rounded, size: 22),
      activeIcon: Icon(Icons.people_rounded, size: 22),
      bodyBuilder: _buildLeadsScreen,
    ),
    const DashboardNavigationItem(
      label: 'Tasks',
      icon: Icon(Icons.check_box_outlined, size: 22),
      activeIcon: Icon(Icons.check_box_rounded, size: 22),
      bodyBuilder: _buildTasksScreen,
    ),
    const DashboardNavigationItem(
      label: 'Search',
      icon: Icon(Icons.search_rounded, size: 22),
      bodyBuilder: _buildSearchPlaceholder,
    ),
  ];

  static Widget _buildDashboardBody(BuildContext context) {
    return const DashboardBody();
  }

  static Widget _buildLeadsScreen(BuildContext context) {
    return const LeadsScreen();
  }

  static Widget _buildTasksScreen(BuildContext context) {
    return const TasksScreen();
  }

  static Widget _buildSearchPlaceholder(BuildContext context) {
    return const Center(
      child: Text(
        'Tab 3 Placeholder',
        style: TextStyle(color: AppColors.textMuted),
      ),
    );
  }
}
