part of 'enquiry_details_bloc.dart';

extension EnquiryDetailsHandlers on EnquiryDetailsBloc {
  Future<void> _onLoad(LoadEnquiryDetails ev, Emitter<EnquiryDetailsState> emit) async {
    emit(EnquiryDetailsLoading());
    try {
      final lead = await leadsRepository.getLeadById(ev.leadId);
      if (lead == null) {
        emit(const EnquiryDetailsError('Lead not found'));
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
      emit(EnquiryDetailsError(e.toString()));
    }
  }

  Future<void> _onChangeStatus(ChangeEnquiryStatus ev, Emitter<EnquiryDetailsState> emit) async {
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

  Future<void> _onAddNote(AddEnquiryNote ev, Emitter<EnquiryDetailsState> emit) async {
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

  Future<void> _onDelete(DeleteEnquiry ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is EnquiryDetailsLoaded) {
      await leadsRepository.deleteLead(s.lead.id);
      emit(EnquiryDetailsDeleted());
    }
  }
}
