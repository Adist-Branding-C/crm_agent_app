import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/activity_models.dart';
import '../../bloc/leads/lead_copy_extensions.dart';
import 'call_log_bloc.dart';

extension CallLogHandlers on CallLogBloc {
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
        if (ev.activityId != null) {
          final list = activityRepository.getActivitiesForLead(ev.lead.id);
          final match = list.where((a) => a.id == ev.activityId).firstOrNull;
          final updated = EnquiryActivity(
            id: ev.activityId!,
            title: '@You logged a call (${ev.callStatus}) - Purpose: ${ev.purpose.label}',
            time: match?.time ?? 'Just now',
            type: EnquiryActivityType.call,
            callStatus: ev.callStatus,
            duration: match?.duration ?? '4:12 mins',
            leadStatus: ev.leadStatus,
            purpose: ev.purpose,
            remark: ev.remark,
            date: match?.date ?? 'Today, 22 June 2026',
            timeOfDay: match?.timeOfDay ?? '9:30 AM',
          );
          activityRepository.updateActivityForLead(ev.lead.id, updated);
        } else {
          final activity = EnquiryActivity.callLog(
            id: DateTime.now().toString(),
            callStatus: ev.callStatus,
            purposeLabel: ev.purpose.label,
            leadStatus: ev.leadStatus,
            purpose: ev.purpose,
            remark: ev.remark,
          );
          activityRepository.addActivityForLead(ev.lead.id, activity);
        }
      }
      emit(CallLogSaveSuccess(lead: updatedLead));
    } catch (e) {
      emit(const CallLogFailure(failure: CallLogFailureType.save));
    }
  }
}
