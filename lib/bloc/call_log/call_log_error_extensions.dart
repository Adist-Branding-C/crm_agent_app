import 'call_log_bloc.dart';

extension CallLogFailureMessage on CallLogFailure {
  String get errorMessage {
    return switch (failure) {
      CallLogFailureType.leadNotFound =>
        'No lead found for "${leadName ?? ""}"',
      CallLogFailureType.save => 'Failed to save call log',
      CallLogFailureType.unknown => 'An error occurred',
    };
  }
}
