import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/attendance/attendance_bloc.dart';
import '../../theme.dart';
import 'dashboard_navigation_config.dart';
import 'models/dashboard_navigation_item.dart';
import 'widgets/dashboard_nav_bar.dart';

/// The main Dashboard Screen wrapper.
class DashboardScreen extends StatefulWidget {
  final List<DashboardNavigationItem>? navigationItems;
  final int initialIndex;

  const DashboardScreen({
    super.key,
    this.navigationItems,
    this.initialIndex = 0,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _navIndex;
  late final List<DashboardNavigationItem> _items;

  @override
  void initState() {
    super.initState();
    _navIndex = widget.initialIndex;
    _items = widget.navigationItems ?? DashboardNavigationConfig.items;
  }

  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      setState(() => _navIndex = widget.initialIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => AttendanceBloc(attendanceRepository: c.read())..add(const LoadAttendance()),
        ),
        BlocProvider(
          create: (c) => DashboardBloc(dashboardRepository: c.read())..add(const FetchDashboardData()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        bottomNavigationBar: DashboardNavBar(
          currentIndex: _navIndex,
          onTap: (index) => setState(() => _navIndex = index),
          items: _items,
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _navIndex,
            children: _items.map((item) => item.bodyBuilder(context)).toList(),
          ),
        ),
      ),
    );
  }
}
