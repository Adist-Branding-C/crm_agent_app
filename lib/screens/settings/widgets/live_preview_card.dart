import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'live_preview_lead_card.dart';
import 'live_preview_call_button.dart';

class LivePreviewCard extends StatelessWidget {
  const LivePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(16.0.w),
      color: Colors.white,
      border: Border.all(color: AppColors.borderLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LIVE PREVIEW',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.bold,
              fontSize: 10.s,
              letterSpacing: 0.5.w,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            'Good morning, Arjun',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 19.s,
            ),
          ),
          AppSpacing.gapXxs,
          Text(
            'You have 6 follow-ups today',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
              fontSize: 13.s,
            ),
          ),
          AppSpacing.gapMd,
          const LivePreviewLeadCard(),
          AppSpacing.gapMd,
          Text(
            'This is how text appears across your dashboard, leads and reports. Pick the size and typeface that read best for you.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
              fontSize: 13.s,
              height: 1.45,
            ),
          ),
          AppSpacing.gapMd,
          const LivePreviewCallButton(),
        ],
      ),
    );
  }
}
