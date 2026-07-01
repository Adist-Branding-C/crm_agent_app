import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';

class LeadCardDetails extends StatelessWidget {
  final Lead lead;

  const LeadCardDetails({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lead.name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapXxs,
        Text(
          '${lead.source.label} · ${lead.status.label}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: 0.3.w,
          ),
        ),
      ],
    );
  }
}
