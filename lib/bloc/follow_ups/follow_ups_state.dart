part of 'follow_ups_bloc.dart';

/// Base class for all states emitted by the [FollowUpsBloc].
abstract class FollowUpsState extends Equatable {
  /// Creates a constant [FollowUpsState].
  const FollowUpsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the follow-ups screen.
class FollowUpsInitial extends FollowUpsState {
  /// Creates a constant [FollowUpsInitial] state.
  const FollowUpsInitial();
}

/// State emitted while loading follow-ups data.
class FollowUpsLoading extends FollowUpsState {
  /// Creates a constant [FollowUpsLoading] state.
  const FollowUpsLoading();
}

/// State emitted when follow-ups are loaded successfully.
class FollowUpsLoaded extends FollowUpsState {
  /// List of retrieved follow-up records.
  final List<FollowUp> followUps;

  /// Optional name of contact currently being called.
  final String? callingName;

  /// Creates a constant [FollowUpsLoaded] state.
  const FollowUpsLoaded({
    required this.followUps,
    this.callingName,
  });

  @override
  List<Object?> get props => [followUps, callingName];
}

/// State emitted when an error occurs.
class FollowUpsError extends FollowUpsState {
  /// Error description message.
  final String errorMessage;

  /// Creates a constant [FollowUpsError] state.
  const FollowUpsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
