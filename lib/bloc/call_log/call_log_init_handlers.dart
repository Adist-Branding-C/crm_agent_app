import 'package:flutter_bloc/flutter_bloc.dart';
import 'call_log_bloc.dart';

extension CallLogInitHandlers on CallLogBloc {
  Future<void> onInitiateCall(InitiateCall ev, Emitter<CallLogState> emit) async {
    emit(CallLogBottomSheetTriggered(lead: ev.lead));
  }

  Future<void> onInitiateCallByName(InitiateCallByName ev, Emitter<CallLogState> emit) async {
    final clean = ev.name.replaceAll('Call back ', '').trim();
    final leads = await leadsRepository.getLeads();
    final matches = leads.where((l) => l.name.toLowerCase() == clean.toLowerCase());
    if (matches.isEmpty) {
      emit(CallLogFailure(failure: CallLogFailureType.leadNotFound, leadName: clean));
      return;
    }
    emit(CallLogBottomSheetTriggered(lead: matches.first));
  }

  Future<void> onLaunchDialer(LaunchDialer ev, Emitter<CallLogState> emit) async {
    emit(CallInProgress(lead: ev.lead));
    final launched = await dialerService.launchDialer(ev.lead.phone);
    if (!launched) {
      emit(const CallLogFailure(failure: CallLogFailureType.unknown));
    }
  }

  void onAppReturnedFromCall(AppReturnedFromCall ev, Emitter<CallLogState> emit) {
    final s = state;
    if (s is CallInProgress) {
      emit(CallLogNavigationPending(lead: s.lead));
    }
  }

  void onResetCallLog(ResetCallLog ev, Emitter<CallLogState> emit) {
    emit(const CallLogInitial());
  }
}
