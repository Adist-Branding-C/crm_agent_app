import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';

extension LoadHandler on EnquiryDetailsBloc {
  Future<void> onLoad(
    LoadEnquiryDetails ev,
    Emitter<EnquiryDetailsState> emit,
  ) async {
    emit(EnquiryDetailsLoading());
    try {
      final lead = await leadsRepository.getLeadById(ev.leadId);
      if (lead == null) {
        emit(const EnquiryDetailsError(EnquiryDetailsFailure.leadNotFound));
        return;
      }
      final activities = activityRepository.getActivitiesForLead(lead.id);
      emit(EnquiryDetailsLoaded(lead: lead, activities: activities, notes: []));
    } catch (_) {
      emit(const EnquiryDetailsError(EnquiryDetailsFailure.unknown));
    }
  }
}
