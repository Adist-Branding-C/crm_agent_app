import 'package:equatable/equatable.dart';

/// Base class for all states emitted by the [LeadsBloc].
abstract class LeadsState extends Equatable {
  const LeadsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Leads page.
class LeadsInitial extends LeadsState {
  const LeadsInitial();
}

/// State representing active data retrieval.
class LeadsLoading extends LeadsState {
  const LeadsLoading();
}

/// State emitted on error occurrence.
class LeadsError extends LeadsState {
  final String message;

  /// Creates a constant [LeadsError].
  const LeadsError(this.message);

  @override
  List<Object?> get props => [message];
}
