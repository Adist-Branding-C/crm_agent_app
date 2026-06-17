import 'package:flutter/material.dart';

/// Represents a dynamic navigation item for the Dashboard bottom navigation.
///
/// Adheres to the Open/Closed Principle by allowing new tabs to be added
/// to the dashboard without modifying the dashboard screen or navigation bar.
class DashboardNavigationItem {
  /// The user-facing label of the tab.
  final String label;

  /// The icon displayed when the tab is unselected.
  final Widget icon;

  /// The icon displayed when the tab is selected.
  final Widget? activeIcon;

  /// The widget tree for this tab's screen/body.
  final Widget body;

  /// Creates a constant [DashboardNavigationItem].
  const DashboardNavigationItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    required this.body,
  });
}
