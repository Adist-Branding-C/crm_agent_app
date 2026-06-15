import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/campaigns_repository.dart';
import 'campaigns_models.dart';

part 'campaigns_event.dart';
part 'campaigns_state.dart';

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
      emit(const CampaignsError(errorMessage: 'Failed to fetch campaigns'));
    }
  }
}
