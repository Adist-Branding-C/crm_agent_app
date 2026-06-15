import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import 'lead_call_button.dart';

/// Card displaying information about a single Lead.
class LeadCard extends StatelessWidget {
  /// The lead details to render.
  final Lead lead;

  /// Creates a constant [LeadCard].
  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          _buildAvatar(),
          const SizedBox(width: 12),
          Expanded(child: _buildDetails(context)),
          LeadCallButton(lead: lead),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: AppColors.primaryColorLight,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        lead.initials,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
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
          '${lead.source} · ${lead.status}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
