import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/campaigns/campaigns_bloc.dart';
import '../../theme.dart';
import 'widgets/campaigns_header.dart';
import 'widgets/campaigns_list.dart';

/// The screen displaying all active and completed marketing campaigns.
class CampaignsScreen extends StatelessWidget {
  /// Creates a constant [CampaignsScreen] widget.
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CampaignsBloc()..add(const LoadCampaigns()),
      child: const Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              CampaignsHeader(),
              Expanded(child: _CampaignsBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _CampaignsBody extends StatelessWidget {
  const _CampaignsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignsBloc, CampaignsState>(
      builder: (context, state) {
        if (state is CampaignsLoading || state is CampaignsInitial) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
        if (state is CampaignsLoaded) {
          return CampaignsList(campaigns: state.campaigns);
        }
        final msg = state is CampaignsError ? state.errorMessage : 'Error';
        return Center(
          child: Text(msg, style: const TextStyle(color: AppColors.errorColor)),
        );
      },
    );
  }
}
