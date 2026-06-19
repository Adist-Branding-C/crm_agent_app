import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/my_activity/my_activity_bloc.dart';
import '../../data/models/my_activity/my_activity_enums.dart';
import '../../data/repositories/my_activity_repository.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/my_activity_header.dart';
import 'widgets/my_activity_time_filters.dart';
import 'widgets/my_activity_type_filters.dart';
import 'widgets/my_activity_lead_selector.dart';
import 'widgets/my_activity_list.dart';
import 'widgets/lead_filter_sheet.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final repo = context.read<MyActivityRepository>();
    return BlocProvider(
      create: (_) => MyActivityBloc(repository: repo)..add(const LoadMyActivity()),
      child: const _MyActivityBody(),
    );
  }
}

class _MyActivityBody extends StatelessWidget {
  const _MyActivityBody();

  void _openLeadSheet(BuildContext ctx, MyActivityLoaded? state) {
    showModalBottomSheet<void>(
      context: ctx, isScrollControlled: true, backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => LeadFilterSheet(
        selectedLead: state?.selectedLead ?? 'All leads',
        availableLeads: state?.availableLeads ?? [],
        onSelected: (name) { Navigator.pop(ctx); if (name != null) ctx.read<MyActivityBloc>().add(LeadFilterChanged(name)); },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PageScaffold(
    padding: EdgeInsets.zero,
    child: BlocBuilder<MyActivityBloc, MyActivityState>(
      builder: (context, state) {
        final loaded = state is MyActivityLoaded ? state : null;
        return Column(children: [
          const MyActivityHeader(),
          const SizedBox(height: 4),
          MyActivityTimeFilters(selected: loaded?.selectedTimeFilter ?? ActivityTimeFilter.all,
            onSelected: (f) => context.read<MyActivityBloc>().add(TimeFilterChanged(f))),
          const SizedBox(height: 12),
          MyActivityTypeFilters(selected: loaded?.selectedTypeFilter ?? ActivityTypeFilter.all,
            onSelected: (label) {
              final t = ActivityTypeFilter.values.firstWhere((e) => e.label == label);
              context.read<MyActivityBloc>().add(TypeFilterChanged(t));
            }),
          const SizedBox(height: 12),
          MyActivityLeadSelector(selectedLead: loaded?.selectedLead ?? 'All leads',
            onTap: () => _openLeadSheet(context, loaded)),
          const SizedBox(height: 8),
          const MyActivityList(),
        ]);
      },
    ),
  );
}
