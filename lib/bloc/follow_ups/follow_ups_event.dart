part of 'follow_ups_bloc.dart';

/// Base class for all events handled by the [FollowUpsBloc].
abstract class FollowUpsEvent extends Equatable {
  /// Creates a constant [FollowUpsEvent].
  const FollowUpsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all follow-ups.
class LoadFollowUps extends FollowUpsEvent {
  /// Creates a constant [LoadFollowUps] event.
  const LoadFollowUps();
}

/// Event to simulate making a call to a lead.
class TriggerCall extends FollowUpsEvent {
  /// ID of the lead to call.
  final String followUpId;

  /// Creates a constant [TriggerCall] event.
  const TriggerCall(this.followUpId);

  @override
  List<Object?> get props => [followUpId];
}
