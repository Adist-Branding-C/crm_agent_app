import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/repositories/leads_repository.dart';
import '../../../router/app_routes.dart';
import '../../follow_ups/widgets/follow_up_item_card.dart';

/// Renders a follow-up search/suggestion result with call and navigation.
class SearchFollowUpTile extends StatelessWidget {
  final FollowUp followUp;

  const SearchFollowUpTile({super.key, required this.followUp});

  @override
  Widget build(BuildContext context) {
    return FollowUpItemCard(
      call: followUp,
      onCallTap: () =>
          context.read<CallLogBloc>().add(InitiateCallByName(name: followUp.name)),
      onCardTap: () async {
        final clean = followUp.name.replaceAll('Call back ', '').trim().toLowerCase();
        final leads = await context.read<LeadsRepository>().getLeads();
        final match = leads.cast<Lead?>().firstWhere(
          (l) => l?.name.toLowerCase() == clean,
          orElse: () => null,
        );
        if (match != null && context.mounted) {
          context.pushNamed(AppRoutes.enquiryDetails, pathParameters: {'id': match.id});
        }
      },
    );
  }
}
