part of 'call_log_bloc.dart';

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

class CallLogFailure extends CallLogState {
  final String error;
  const CallLogFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
