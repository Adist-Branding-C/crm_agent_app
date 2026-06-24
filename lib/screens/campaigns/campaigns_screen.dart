import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/campaigns/campaigns_bloc.dart';
import '../../bloc/campaigns/campaigns_models.dart';
import '../../data/repositories/campaigns_repository.dart';
import '../../widgets/async_state_view.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/campaigns_header.dart';
import 'widgets/campaigns_list.dart';

String _campaignsErrorString(CampaignsFailure f) {
  switch (f) {
    case CampaignsFailure.load:
      return 'Failed to fetch campaigns';
    case CampaignsFailure.unknown:
      return 'An error occurred';
  }
}

/// The screen displaying all active and completed marketing campaigns.
class CampaignsScreen extends StatelessWidget {
  /// Creates a constant [CampaignsScreen] widget.
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CampaignsBloc(
        campaignsRepository: context.read<CampaignsRepository>(),
      )..add(const LoadCampaigns()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Column(
          children: const [
            CampaignsHeader(),
            Expanded(child: _CampaignsBody()),
          ],
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
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        final campaigns = state is CampaignsLoaded
            ? state.campaigns
            : const <Campaign>[];

        return AsyncStateView(
          isLoading: state is CampaignsLoading || state is CampaignsInitial,
          hasError: state is CampaignsError,
          errorMessage: state is CampaignsError
              ? _campaignsErrorString(state.failure)
              : 'Error',
          onRetry: () =>
              context.read<CampaignsBloc>().add(const LoadCampaigns()),
          child: CampaignsList(campaigns: campaigns),
        );
      },
    );
  }
}
