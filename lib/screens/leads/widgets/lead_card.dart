import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../widgets/call_button.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import 'lead_card_details.dart';

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
        padding: AppSpacing.cardPaddingCompact,
        child: Row(
          children: [
            UserAvatar(initials: lead.initials, size: 45.s,fontSize: 15.s,),
            AppSpacing.gapWMd,
            Expanded(child: LeadCardDetails(lead: lead)),
            CallButton(
            
              onTap: () =>
                  context.read<CallLogBloc>().add(InitiateCall(lead: lead)),
            ),
          ],
        ),
      ),
    );
  }
}
