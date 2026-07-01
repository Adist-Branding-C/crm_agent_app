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
    final count = context.select((CampaignsBloc b) {
      final s = b.state;
      return s is CampaignsLoaded ? s.campaigns.length : 0;
    });

    return ScreenHeader(
      title: 'Campaigns',
      subtitle: '$count active',
      padding: EdgeInsets.fromLTRB(
        17.0.w,
        20.0.h,
        17.0.w,
        13.0.h,
      ),
      showBackButton: true,
    );
  }
}
