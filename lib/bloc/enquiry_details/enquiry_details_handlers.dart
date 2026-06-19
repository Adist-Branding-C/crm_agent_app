import 'package:flutter_bloc/flutter_bloc.dart';
import 'enquiry_details_bloc.dart';
import 'enquiry_details_models.dart';

extension EnquiryDetailsHandlers on EnquiryDetailsBloc {
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
    } catch (e) {
      emit(const EnquiryDetailsError(EnquiryDetailsFailure.unknown));
    }
  }

  Future<void> onChangeStatus(ChangeEnquiryStatus ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is EnquiryDetailsLoaded) {
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

  Future<void> onAddNote(AddEnquiryNote ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is EnquiryDetailsLoaded) {
      final newNote = EnquiryNote(
        id: DateTime.now().toString(), author: '@You',
        content: ev.content, time: 'Just now',
      );
      final newAct = EnquiryActivity(
        id: DateTime.now().toString(),
        title: '@You added a note on ${s.lead.name}',
        time: 'Just now', type: EnquiryActivityType.note,
      );
      activityRepository.addActivityForLead(s.lead.id, newAct);
      emit(s.copyWith(
        notes: [newNote, ...s.notes],
        activities: [newAct, ...s.activities],
      ));
    }
  }

  Future<void> onDelete(DeleteEnquiry ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is EnquiryDetailsLoaded) {
      await leadsRepository.deleteLead(s.lead.id);
      emit(EnquiryDetailsDeleted());
    }
  }
}
