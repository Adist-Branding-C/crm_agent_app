import 'package:flutter_bloc/flutter_bloc.dart';
import '../../leads/leads_models.dart';
import '../enquiry_details_bloc.dart';
import '../enquiry_details_models.dart';

extension UpdateHandler on EnquiryDetailsBloc {
  Future<void> onUpdateDetails(
    UpdateEnquiryDetails ev,
    Emitter<EnquiryDetailsState> emit,
  ) async {
    final s = state;
    if (s is! EnquiryDetailsLoaded) return;
    final updated = Lead(
      id: s.lead.id,
      name: ev.name,
      phone: ev.phone,
      email: ev.email,
      location: ev.location,
      leadSource: ev.source,
      source: ev.purpose,
      category: ev.category,
      status: ev.status,
      nextFollowUp: ev.nextFollowUp,
      note: ev.note,
    );
    await leadsRepository.updateLead(updated);
    final newAct = EnquiryActivity(
      id: DateTime.now().toString(),
      title: '@You updated enquiry details of ${updated.name}',
      time: 'Just now',
      type: EnquiryActivityType.system,
    );
    activityRepository.addActivityForLead(s.lead.id, newAct);
    emit(s.copyWith(lead: updated, activities: [newAct, ...s.activities]));
  }
}
