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
        Text(lead.name, style:TextStyle(fontSize: 14.s, fontWeight: FontWeight.bold,color: AppColors.textDark),),
        AppSpacing.gapXxs,
        Text(
          '${lead.source.label} · ${lead.status.label}',
          style: TextStyle(fontSize: 10.s, color: AppColors.textMuted,letterSpacing: 0.3.w,),
        ),
      ],
    );
  }
}
