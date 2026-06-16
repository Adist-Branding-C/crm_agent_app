import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../theme.dart';
import 'quick_action_button.dart';

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
          onTap: () => context.read<CallLogBloc>().add(
                InitiateCall(lead: lead),
              ),
          icon: Icons.phone_in_talk,
          label: 'Call',
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        const SizedBox(width: 16),
        QuickActionButton(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening WhatsApp for ${lead.name}...')),
            );
          },
          icon: Icons.chat,
          label: 'WhatsApp',
          backgroundColor: AppColors.successBackground,
          foregroundColor: AppColors.success,
        ),
      ],
    );
  }
}
