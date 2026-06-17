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

enum CallLogFailureType { leadNotFound, save, unknown }

class CallLogFailure extends CallLogState {
  final CallLogFailureType failure;
  final String? leadName;
  const CallLogFailure({required this.failure, this.leadName});

  String get error {
    switch (failure) {
      case CallLogFailureType.leadNotFound:
        return 'No lead found for "${leadName ?? ""}"';
      case CallLogFailureType.save: return 'Failed to save call log';
      case CallLogFailureType.unknown: return 'An error occurred';
    }
  }

  @override
  List<Object?> get props => [failure, leadName];
}
