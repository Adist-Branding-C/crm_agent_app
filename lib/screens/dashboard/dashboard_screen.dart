import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../bloc/attendance/attendance_bloc.dart';
import '../../bloc/notifications/notifications_bloc.dart';
import 'dashboard_navigation_config.dart';
import 'models/dashboard_navigation_item.dart';
import 'widgets/dashboard_tabbed_body.dart';

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
    
    // Eagerly trigger global loads once authenticated dashboard is entered
    context.read<AccountBloc>().add(const LoadAccount());
    context.read<AttendanceBloc>().add(const LoadAttendance());
    context.read<NotificationsBloc>().add(const LoadNotifications());

    _items = widget.navigationItems ?? DashboardNavigationConfig.items;
    if (widget.initialFilter == 'overdue') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<TasksBloc>().add(
            const FilterChanged(TasksFilter.overdue),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DashboardTabbedBody(items: _items);
  }
}

