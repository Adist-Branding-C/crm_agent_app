import '../../../bloc/leads/leads_enums.dart';

class CallLogFormState {
  final String callStatus;
  final LeadStatus leadStatus;
  final LeadPurpose purpose;

  const CallLogFormState({
    this.callStatus = 'Connected',
    required this.leadStatus,
    required this.purpose,
  });

  CallLogFormState copyWith({
    String? callStatus,
    LeadStatus? leadStatus,
    LeadPurpose? purpose,
  }) => CallLogFormState(
    callStatus: callStatus ?? this.callStatus,
    leadStatus: leadStatus ?? this.leadStatus,
    purpose: purpose ?? this.purpose,
  );
}
