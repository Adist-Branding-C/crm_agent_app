import 'package:equatable/equatable.dart';
import '../../bloc/leads/leads_models.dart';

abstract class CallLogState extends Equatable {
  const CallLogState();

  @override
  List<Object?> get props => [];
}

class CallLogInitial extends CallLogState {
  const CallLogInitial();
}

class CallInProgress extends CallLogState {
  final Lead lead;
  const CallInProgress({required this.lead});

  @override
  List<Object?> get props => [lead];
}

class CallLogNavigationPending extends CallLogState {
  final Lead lead;
  const CallLogNavigationPending({required this.lead});

  @override
  List<Object?> get props => [lead];
}

class CallLogSaving extends CallLogState {
  const CallLogSaving();
}

class CallLogSaveSuccess extends CallLogState {
  final Lead lead;
  const CallLogSaveSuccess({required this.lead});

  @override
  List<Object?> get props => [lead];
}

enum CallLogFailureType { leadNotFound, save, unknown }

class CallLogFailure extends CallLogState {
  final CallLogFailureType failure;
  final String? leadName;
  const CallLogFailure({required this.failure, this.leadName});

  @override
  List<Object?> get props => [failure, leadName];
}
