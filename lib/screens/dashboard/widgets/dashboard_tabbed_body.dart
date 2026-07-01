import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../theme.dart';
import '../../../../widgets/lazy_indexed_stack.dart';
import '../dashboard_tab_notifier.dart';
import '../models/dashboard_navigation_item.dart';
import 'dashboard_nav_bar.dart';

/// Tabbed layout container for the Dashboard shell.
class DashboardTabbedBody extends StatelessWidget {
  /// List of navigation tab items.
  final List<DashboardNavigationItem> items;

  /// Creates a [DashboardTabbedBody].
  const DashboardTabbedBody({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final tabNotifier = context.watch<DashboardTabNotifier>();
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      bottomNavigationBar: DashboardNavBar(
        currentIndex: tabNotifier.currentIndex,
        onTap: tabNotifier.setIndex,
        items: items,
      ),
      body: SafeArea(
        child: LazyIndexedStack(
          index: tabNotifier.currentIndex,
          children: items.map((item) => item.body).toList(),
        ),
      ),
    );
  }
}
