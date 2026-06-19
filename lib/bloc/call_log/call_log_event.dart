import 'package:equatable/equatable.dart';
import '../../bloc/leads/leads_models.dart';
import '../../bloc/leads/leads_enums.dart';

abstract class CallLogEvent extends Equatable {
  const CallLogEvent();

  @override
  List<Object?> get props => [];
}

class InitiateCall extends CallLogEvent {
  final Lead lead;
  const InitiateCall({required this.lead});

  @override
  List<Object?> get props => [lead];
}

class InitiateCallByName extends CallLogEvent {
  final String name;
  const InitiateCallByName({required this.name});

  @override
  List<Object?> get props => [name];
}

class AppReturnedFromCall extends CallLogEvent {
  const AppReturnedFromCall();
}

class SaveCallLog extends CallLogEvent {
  final Lead lead;
  final String callStatus;
  final LeadStatus leadStatus;
  final LeadPurpose purpose;
  final String remark;

  const SaveCallLog({
    required this.lead,
    required this.callStatus,
    required this.leadStatus,
    required this.purpose,
    required this.remark,
  });

  @override
  List<Object?> get props => [lead, callStatus, leadStatus, purpose, remark];
}

class ResetCallLog extends CallLogEvent {
  const ResetCallLog();
}
