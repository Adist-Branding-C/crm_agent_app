import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/campaigns/campaigns_bloc.dart';
import '../../../widgets/screen_header.dart';
import '../../../theme.dart';

/// Header widget for the Campaigns Screen showing a back button and titles.
class CampaignsHeader extends StatelessWidget {
  /// Creates a constant [CampaignsHeader].
  const CampaignsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: 'Campaigns',
      subtitleWidget: BlocBuilder<CampaignsBloc, CampaignsState>(
        buildWhen: (prev, curr) => curr is CampaignsLoaded,
        builder: (context, state) {
          final count = state is CampaignsLoaded ? state.campaigns.length : 0;
          return Text(
            '$count active',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
      showBackButton: true,
    );
  }
}
