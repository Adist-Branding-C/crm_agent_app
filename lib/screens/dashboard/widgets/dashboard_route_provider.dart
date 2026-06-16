import 'package:flutter/material.dart';
import '../dashboard_screen.dart';

/// Wraps the [DashboardScreen].
class DashboardRouteProvider extends StatelessWidget {
  final int initialIndex;
  final String? initialFilter;

  const DashboardRouteProvider({
    super.key,
    required this.initialIndex,
    this.initialFilter,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      initialIndex: initialIndex,
      initialFilter: initialFilter,
    );
  }
}
