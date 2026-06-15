import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../widgets/call_button.dart';
import '../../../theme.dart';

/// Card displaying information about a single Lead.
class LeadCard extends StatelessWidget {
  /// The lead details to render.
  final Lead lead;

  /// Creates a constant [LeadCard].
  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          UserAvatar(
            initials: lead.initials,
            size: 42,
          ),
          const SizedBox(width: 12),
          Expanded(child: _buildDetails(context)),
          CallButton(
            borderRadius: 12,
            onTap: () {
              developer.log('Initiating mock call to ${lead.name} (${lead.phone})');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Calling ${lead.name}...'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lead.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${lead.source.label} · ${lead.status.label}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
