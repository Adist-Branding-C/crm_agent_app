export 'campaigns_event.dart';
export 'campaigns_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/campaigns_repository.dart';
import 'campaigns_models.dart';

import 'campaigns_event.dart';
import 'campaigns_state.dart';

/// BLoC managing states and events for Campaigns.
class CampaignsBloc extends Bloc<CampaignsEvent, CampaignsState> {
  /// The campaigns repository.
  final CampaignsRepository campaignsRepository;

  /// Initializes the BLoC.
  CampaignsBloc({required this.campaignsRepository})
      : super(const CampaignsInitial()) {
    on<LoadCampaigns>(_onLoadCampaigns);
  }

  Future<void> _onLoadCampaigns(
    LoadCampaigns event,
    Emitter<CampaignsState> emit,
  ) async {
    emit(const CampaignsLoading());
    try {
      final campaignsList = await campaignsRepository.getCampaigns();
      emit(CampaignsLoaded(campaigns: campaignsList));
    } catch (e) {
      emit(const CampaignsError(failure: CampaignsFailure.load));
    }
  }
}
