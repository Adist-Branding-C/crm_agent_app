import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../theme.dart';
import '../leads/leads_screen.dart';
import 'widgets/dashboard_body.dart';
import 'widgets/dashboard_nav_bar.dart';

/// The main Dashboard Screen wrapper.
class DashboardScreen extends StatefulWidget {
  /// Creates a constant [DashboardScreen] widget.
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(const FetchDashboardData()),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        bottomNavigationBar: DashboardNavBar(
          currentIndex: _navIndex,
          onTap: (index) => setState(() => _navIndex = index),
        ),
        body: SafeArea(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    switch (_navIndex) {
      case 0:
        return const DashboardBody();
      case 1:
        return const LeadsScreen();
      default:
        return Center(
          child: Text(
            'Tab $_navIndex Placeholder',
            style: const TextStyle(color: AppColors.textMuted),
          ),
        );
    }
  }
}
