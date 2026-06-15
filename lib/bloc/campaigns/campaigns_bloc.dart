import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'campaigns_models.dart';

part 'campaigns_event.dart';
part 'campaigns_state.dart';

/// BLoC managing states and events for Campaigns.
class CampaignsBloc extends Bloc<CampaignsEvent, CampaignsState> {
  /// Initializes the BLoC.
  CampaignsBloc() : super(const CampaignsInitial()) {
    on<LoadCampaigns>(_onLoadCampaigns);
  }

  Future<void> _onLoadCampaigns(
    LoadCampaigns event,
    Emitter<CampaignsState> emit,
  ) async {
    emit(const CampaignsLoading());
    try {
      // Mock API call latency
      await Future.delayed(const Duration(milliseconds: 400));

      final campaignsList = [
        const Campaign(
          id: '1',
          title: 'May Admission Drive',
          type: 'Call',
          creator: 'Branch Head',
          doneCount: 52,
          totalCount: 80,
        ),
        const Campaign(
          id: '2',
          title: 'Onam Early Bird Offer',
          type: 'WhatsApp',
          creator: 'Marketing',
          doneCount: 31,
          totalCount: 120,
        ),
        const Campaign(
          id: '3',
          title: 'Re-engage Cold Leads',
          type: 'Call',
          creator: 'Arjun Nair',
          doneCount: 45,
          totalCount: 45,
        ),
        const Campaign(
          id: '4',
          title: 'Demo Follow-up Blast',
          type: 'Email',
          creator: 'Branch Head',
          doneCount: 18,
          totalCount: 60,
        ),
      ];

      emit(CampaignsLoaded(campaigns: campaignsList));
    } catch (e) {
      emit(const CampaignsError(errorMessage: 'Failed to fetch campaigns'));
    }
  }
}
