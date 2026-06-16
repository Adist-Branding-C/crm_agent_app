import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
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
          onTap: () {
            developer.log('Mock calling ${lead.name} (${lead.phone})');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Calling ${lead.name}...')),
            );
          },
          icon: Icons.phone_in_talk,
          label: 'Call',
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        const SizedBox(width: 16),
        QuickActionButton(
          onTap: () {
            developer.log('Opening mock WhatsApp chat with ${lead.name}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening WhatsApp for ${lead.name}...')),
            );
          },
          icon: Icons.chat,
          label: 'WhatsApp',
          backgroundColor: const Color(0xFFECFDF5),
          foregroundColor: const Color(0xFF10B981),
        ),
      ],
    );
  }
}
