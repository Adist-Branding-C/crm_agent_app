part of 'call_log_bloc.dart';

extension CallLogHandlers on CallLogBloc {
  Future<void> _onInitiateCall(InitiateCall ev, Emitter<CallLogState> emit) async {
    emit(CallInProgress(lead: ev.lead));
    await dialerService.launchDialer(ev.lead.phone);
  }

  Future<void> _onInitiateCallByName(InitiateCallByName ev, Emitter<CallLogState> emit) async {
    final clean = ev.name.replaceAll('Call back ', '').trim();
    final leads = await leadsRepository.getLeads();
    final match = leads.firstWhere(
      (l) => l.name.toLowerCase() == clean.toLowerCase(),
      orElse: () => Lead(
        name: clean, phone: '9876543210',
        status: LeadStatus.newStatus, source: LeadPurpose.enquiry,
        category: LeadCategory.cold, location: '',
      ),
    );
    emit(CallInProgress(lead: match));
    await dialerService.launchDialer(match.phone);
  }

  void _onAppReturnedFromCall(AppReturnedFromCall ev, Emitter<CallLogState> emit) {
    final s = state;
    if (s is CallInProgress) {
      emit(CallLogNavigationPending(lead: s.lead));
    }
  }

  Future<void> _onSaveCallLog(SaveCallLog ev, Emitter<CallLogState> emit) async {
    emit(const CallLogSaving());
    try {
      final updatedLead = Lead(
        id: ev.lead.id,
        name: ev.lead.name,
        status: ev.leadStatus,
        source: ev.purpose,
        category: ev.lead.category,
        phone: ev.lead.phone,
        location: ev.lead.location,
        email: ev.lead.email,
        leadSource: ev.lead.leadSource,
        nextFollowUp: ev.lead.nextFollowUp,
        note: ev.remark.isNotEmpty ? ev.remark : ev.lead.note,
      );

      if (ev.lead.id.isNotEmpty) {
        await leadsRepository.updateLead(updatedLead);
        final activity = EnquiryActivity(
          id: DateTime.now().toString(),
          title: '@You logged a call (${ev.callStatus}) - Purpose: ${ev.purpose.label}',
          time: 'Just now',
          type: EnquiryActivityType.call,
        );
        leadsRepository.addActivityForLead(ev.lead.id, activity);
      }
      emit(CallLogSaveSuccess(lead: updatedLead));
      emit(const CallLogInitial());
    } catch (e) {
      emit(CallLogFailure(error: e.toString()));
    }
  }

  void _onResetCallLog(ResetCallLog ev, Emitter<CallLogState> emit) {
    emit(const CallLogInitial());
  }
}
