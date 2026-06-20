import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../dashboard_screen.dart';
import '../dashboard_tab_notifier.dart';

class DashboardRouteProvider extends StatefulWidget {
  final int initialIndex;
  final String? initialFilter;

  const DashboardRouteProvider({
    super.key,
    required this.initialIndex,
    this.initialFilter,
  });

  @override
  State<DashboardRouteProvider> createState() => _DashboardRouteProviderState();
}

class _DashboardRouteProviderState extends State<DashboardRouteProvider> {
  DashboardTabNotifier? _tabNotifier;
  late final DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _dashboardBloc = DashboardBloc(dashboardRepository: context.read())
      ..add(const FetchDashboardData());
    WidgetsBinding.instance.addPostFrameCallback((_) => _restoreTabIndex());
  }

  Future<void> _restoreTabIndex() async {
    if (!mounted) return;
    final saved = await DashboardTabNotifier.loadSavedIndex(defaultIndex: widget.initialIndex);
    if (!mounted) return;
    setState(() {
      _tabNotifier = DashboardTabNotifier(initialIndex: saved);
    });
  }

  @override
  void dispose() {
    _tabNotifier?.dispose();
    _dashboardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = _tabNotifier ?? DashboardTabNotifier(initialIndex: widget.initialIndex);
    return ChangeNotifierProvider.value(
      value: notifier,
      child: BlocProvider.value(
        value: _dashboardBloc,
        child: DashboardScreen(
          initialIndex: widget.initialIndex,
          initialFilter: widget.initialFilter,
        ),
      ),
    );
  }
}
