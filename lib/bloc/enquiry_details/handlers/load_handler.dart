import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';
import '../enquiry_details_mock_helper.dart';

extension LoadHandler on EnquiryDetailsBloc {
  Future<void> onLoad(LoadEnquiryDetails ev, Emitter<EnquiryDetailsState> emit) async {
    emit(EnquiryDetailsLoading());
    try {
      final lead = await leadsRepository.getLeadById(ev.leadId);
      if (lead == null) {
        emit(const EnquiryDetailsError(EnquiryDetailsFailure.leadNotFound));
        return;
      }
      final customAct = activityRepository.getActivitiesForLead(lead.id);
      final defaultAct = EnquiryDetailsMockHelper.getActivities(lead.name);
      emit(EnquiryDetailsLoaded(
        lead: lead,
        activities: [...customAct, ...defaultAct],
        notes: EnquiryDetailsMockHelper.getNotes(lead),
      ));
    } catch (_) {
      emit(const EnquiryDetailsError(EnquiryDetailsFailure.unknown));
    }
  }
}
