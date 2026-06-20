import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/activity_models.dart';
import '../../bloc/leads/leads_models.dart';
import 'call_log_bloc.dart';

extension CallLogHandlers on CallLogBloc {
  Future<void> onInitiateCall(InitiateCall ev, Emitter<CallLogState> emit) async {
    emit(CallInProgress(lead: ev.lead));
    await dialerService.launchDialer(ev.lead.phone);
  }

  Future<void> onInitiateCallByName(InitiateCallByName ev, Emitter<CallLogState> emit) async {
    final clean = ev.name.replaceAll('Call back ', '').trim();
    final leads = await leadsRepository.getLeads();
    final matches = leads.where((l) => l.name.toLowerCase() == clean.toLowerCase());
    if (matches.isEmpty) {
      emit(CallLogFailure(failure: CallLogFailureType.leadNotFound, leadName: clean));
      return;
    }
    emit(CallInProgress(lead: matches.first));
    await dialerService.launchDialer(matches.first.phone);
  }

  void onAppReturnedFromCall(AppReturnedFromCall ev, Emitter<CallLogState> emit) {
    final s = state;
    if (s is CallInProgress) {
      emit(CallLogNavigationPending(lead: s.lead));
    }
  }

  Future<void> onSaveCallLog(SaveCallLog ev, Emitter<CallLogState> emit) async {
    emit(const CallLogSaving());
    try {
      final updatedLead = ev.lead.copyWithCallLog(
        newStatus: ev.leadStatus,
        newPurpose: ev.purpose,
        remark: ev.remark,
      );
      if (ev.lead.id.isNotEmpty) {
        await leadsRepository.updateLead(updatedLead);
        final activity = EnquiryActivity(
          id: DateTime.now().toString(),
          title: '@You logged a call (${ev.callStatus}) - Purpose: ${ev.purpose.label}',
          time: 'Just now',
          type: EnquiryActivityType.call,
        );
        activityRepository.addActivityForLead(ev.lead.id, activity);
      }
      emit(CallLogSaveSuccess(lead: updatedLead));
    } catch (e) {
      emit(const CallLogFailure(failure: CallLogFailureType.save));
    }
  }

  void onResetCallLog(ResetCallLog ev, Emitter<CallLogState> emit) {
    emit(const CallLogInitial());
  }
}
