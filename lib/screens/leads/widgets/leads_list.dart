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
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType || (curr is LeadsLoaded && (prev as LeadsLoaded?)?.filteredLeads != curr.filteredLeads),
      builder: (context, state) {
        if (state is LeadsLoading || state is LeadsInitial) {
          return ListView.builder(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 4,
              bottom: 24,
            ),
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppShimmerWidget.card(height: 72),
            ),
          );
        }
        if (state is LeadsLoaded) {
          final list = state.filteredLeads;
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'No leads found',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 4,
              bottom: 24,
            ),
            itemCount: list.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
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
