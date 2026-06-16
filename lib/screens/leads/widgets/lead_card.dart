import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../widgets/call_button.dart';
import '../../../theme.dart';

part 'lead_card_details.dart';

/// Card displaying information about a single Lead.
class LeadCard extends StatelessWidget {
  /// The lead details to render.
  final Lead lead;

  /// Creates a constant [LeadCard].
  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.enquiryDetails,
        pathParameters: {'id': lead.id},
      ),
      child: CustomCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            UserAvatar(
              initials: lead.initials,
              size: 42,
            ),
            const SizedBox(width: 12),
            Expanded(child: _LeadCardDetails(lead: lead)),
            CallButton(
              borderRadius: 12,
              onTap: () => context.read<CallLogBloc>().add(
                InitiateCall(lead: lead),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
