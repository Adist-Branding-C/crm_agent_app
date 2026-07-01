import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_shimmer_widget.dart';
import '../../../theme.dart';
import 'lead_card.dart';

/// Renders the list of filtered leads.
class LeadsList extends StatelessWidget {
  /// Creates a constant [LeadsList].
  const LeadsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      buildWhen: (prev, curr) =>
          prev.runtimeType != curr.runtimeType ||
          (prev is LeadsLoaded &&
              curr is LeadsLoaded &&
              prev.filteredLeads != curr.filteredLeads),
      builder: (context, state) {
        if (state is LeadsLoading || state is LeadsInitial) {
          return ListView.builder(
            padding:  EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 4.h,
              bottom: 24.h,
            ),
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: AppShimmerWidget.card(height: 72),
            ),
          );
        }
        if (state is LeadsLoaded) {
          final list = state.filteredLeads;
          if (list.isEmpty) {
            return  Center(
              child: Text(
                'No leads found',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.only(
              left: AppSpacing.xxl,
              right: AppSpacing.xxl,
              top: 2.h,
              bottom: 4.h,
            ),
            itemCount: list.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: LeadCard(lead: list[index]),
            ),
          );
        }
        final msg = state is LeadsError ? state.message : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () => context.read<LeadsBloc>().add(const FetchLeads()),
        );
      },
    );
  }
}
