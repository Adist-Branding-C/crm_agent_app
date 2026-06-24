import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import '../../../bloc/my_activity/my_activity_bloc.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../widgets/page_scaffold.dart';
import 'my_activity_header.dart';
import 'my_activity_time_filters.dart';
import 'my_activity_type_filters.dart';
import 'my_activity_lead_selector.dart';
import 'my_activity_list.dart';
import 'lead_filter_sheet.dart';


class MyActivityBody extends StatelessWidget {
  const MyActivityBody({super.key});

  void _openLeadSheet(BuildContext ctx) {
    final state = ctx.read<MyActivityBloc>().state;
    final loaded = state is MyActivityLoaded ? state : null;
    showModalBottomSheet<void>(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => LeadFilterSheet(
        selectedLead: loaded?.selectedLead ?? 'All leads',
        availableLeads: loaded?.availableLeads ?? [],
        onSelected: (name) {
          Navigator.pop(ctx);
          if (name != null) ctx.read<MyActivityBloc>().add(LeadFilterChanged(name));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const MyActivityHeader(),
          AppSpacing.gapXs,
          BlocSelector<MyActivityBloc, MyActivityState, ActivityTimeFilter>(
            selector: (s) => s is MyActivityLoaded ? s.selectedTimeFilter : ActivityTimeFilter.all,
            builder: (ctx, selected) => MyActivityTimeFilters(
              selected: selected,
              onSelected: (f) => ctx.read<MyActivityBloc>().add(TimeFilterChanged(f)),
            ),
          ),
          AppSpacing.gapMd,
          BlocSelector<MyActivityBloc, MyActivityState, ActivityTypeFilter>(
            selector: (s) => s is MyActivityLoaded ? s.selectedTypeFilter : ActivityTypeFilter.all,
            builder: (ctx, selected) => MyActivityTypeFilters(
              selected: selected,
              onSelected: (label) {
                final t = ActivityTypeFilter.values.firstWhere((e) => e.label == label);
                ctx.read<MyActivityBloc>().add(TypeFilterChanged(t));
              },
            ),
          ),
          AppSpacing.gapMd,
          BlocSelector<MyActivityBloc, MyActivityState, String>(
            selector: (s) => s is MyActivityLoaded ? s.selectedLead : 'All leads',
            builder: (ctx, selected) => MyActivityLeadSelector(
              selectedLead: selected,
              onTap: () => _openLeadSheet(ctx),
            ),
          ),
          AppSpacing.gapSm,
          const MyActivityList(),
        ],
      ),
    );
  }
}
