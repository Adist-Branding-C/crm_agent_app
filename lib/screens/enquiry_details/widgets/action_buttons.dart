import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../theme.dart';
import 'quick_action_button.dart';
import 'whatsapp_bottom_sheet.dart';

/// Renders the primary Call and WhatsApp action buttons side-by-side.
class ActionButtons extends StatelessWidget {
  /// The lead data.
  final Lead lead;

  /// Creates a constant [ActionButtons].
  const ActionButtons({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuickActionButton(
          onTap: () =>
              context.read<CallLogBloc>().add(InitiateCall(lead: lead)),
          icon: const Icon(Icons.phone_in_talk, color: Colors.white, size: 18),
          label: 'Call',
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        AppSpacing.gapWLg,
        QuickActionButton(
          onTap: () => WhatsAppBottomSheet.show(context, lead: lead),
          icon: const FaIcon(
            FontAwesomeIcons.whatsapp,
            color: AppColors.success,
            size: 18,
          ),
          label: 'WhatsApp',
          backgroundColor: AppColors.successBackground,
          foregroundColor: AppColors.success,
        ),
      ],
    );
  }
}
