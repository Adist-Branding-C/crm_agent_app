import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/leads/leads_bloc.dart';
import '../../theme.dart';
import 'widgets/leads_filter_tabs.dart';
import 'widgets/leads_header.dart';
import 'widgets/leads_list.dart';
import 'widgets/leads_search_bar.dart';

/// The container screen representing the Leads page.
class LeadsScreen extends StatelessWidget {
  /// Creates a constant [LeadsScreen].
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeadsBloc()..add(const FetchLeads()),
      child: const Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Column(
          children: [
            LeadsHeader(),
            LeadsSearchBar(),
            SizedBox(height: 12),
            LeadsFilterTabs(),
            SizedBox(height: 16),
            Expanded(child: LeadsList()),
          ],
        ),
      ),
    );
  }
}
