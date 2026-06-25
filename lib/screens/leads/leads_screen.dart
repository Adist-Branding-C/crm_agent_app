import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/leads/leads_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
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
    final repo = context.read<LeadsRepository>();

    return BlocProvider(
      create: (context) =>
          LeadsBloc(leadsRepository: repo)..add(const FetchLeads()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child:  Column(
          children: [
            LeadsHeader(),
            LeadsSearchBar(),
            SizedBox(height: AppSpacing.md),
            LeadsFilterTabs(),
            SizedBox(height: AppSpacing.lg),
            Expanded(child: LeadsList()),
          ],
        ),
      ),
    );
  }
}
