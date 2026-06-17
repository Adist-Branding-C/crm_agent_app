import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/call_log/call_log_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../theme.dart';
import 'dashboard_navigation_config.dart';
import 'dashboard_tab_notifier.dart';
import 'models/dashboard_navigation_item.dart';
import 'widgets/dashboard_nav_bar.dart';

/// The main Dashboard Screen wrapper.
class DashboardScreen extends StatefulWidget {
  final List<DashboardNavigationItem>? navigationItems;
  final int initialIndex;
  final String? initialFilter;

  const DashboardScreen({
    super.key,
    this.navigationItems,
    this.initialIndex = 0,
    this.initialFilter,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final List<DashboardNavigationItem> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.navigationItems ?? DashboardNavigationConfig.items;
    if (widget.initialFilter == 'overdue') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.read<TasksBloc>().add(const FilterChanged(TasksFilter.overdue));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabNotifier = context.watch<DashboardTabNotifier>();
    return BlocProvider(
      create: (c) => DashboardBloc(
        dashboardRepository: c.read(),
      )..add(const FetchDashboardData()),
      child: BlocListener<CallLogBloc, CallLogState>(
        listener: (context, state) {
          if (state is CallLogSaveSuccess) {
            context.read<DashboardBloc>().add(const FetchDashboardData());
          }
        },
        child: Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          bottomNavigationBar: DashboardNavBar(
            currentIndex: tabNotifier.currentIndex,
            onTap: tabNotifier.setIndex,
            items: _items,
          ),
          body: SafeArea(
            child: IndexedStack(
              index: tabNotifier.currentIndex,
              children: _items.map((item) => item.body).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
