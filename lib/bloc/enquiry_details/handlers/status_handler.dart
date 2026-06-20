import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';
import '../enquiry_details_mock_helper.dart';
import '../enquiry_details_models.dart';

extension StatusHandler on EnquiryDetailsBloc {
  Future<void> onChangeStatus(ChangeEnquiryStatus ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is! EnquiryDetailsLoaded) return;
    final updated = EnquiryDetailsMockHelper.copyLeadWithStatus(s.lead, ev.status);
    await leadsRepository.updateLead(updated);
    final newAct = EnquiryActivity(
      id: DateTime.now().toString(),
      title: '@You changed status of ${s.lead.name} -> ${ev.status.label}',
      time: 'Just now', type: EnquiryActivityType.statusChange,
    );
    activityRepository.addActivityForLead(s.lead.id, newAct);
    emit(s.copyWith(lead: updated, activities: [newAct, ...s.activities]));
  }
}
