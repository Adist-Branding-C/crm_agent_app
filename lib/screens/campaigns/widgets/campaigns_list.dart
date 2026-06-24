import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../theme.dart';
import 'campaign_card.dart';

/// A scrollable list of Campaign Cards.
class CampaignsList extends StatelessWidget {
  final List<Campaign> campaigns;

  /// Creates a constant [CampaignsList].
  const CampaignsList({super.key, required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(AppSpacing.xxl, AppSpacing.sm, AppSpacing.xxl, AppSpacing.xxl),
      physics: const BouncingScrollPhysics(),
      itemCount: campaigns.length,
      separatorBuilder: (context, index) => AppSpacing.gapLg,
      itemBuilder: (context, index) {
        return CampaignCard(campaign: campaigns[index]);
      },
    );
  }
}
