part of 'my_activity_bloc.dart';

/// Base class for all My Activity events.
abstract class MyActivityEvent extends Equatable {
  const MyActivityEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to load initial activity data.
class LoadMyActivity extends MyActivityEvent {
  const LoadMyActivity();
}

/// Event dispatched when a time filter chip is tapped.
class TimeFilterChanged extends MyActivityEvent {
  final ActivityTimeFilter filter;

  const TimeFilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}

/// Event dispatched when a type filter chip is tapped.
class TypeFilterChanged extends MyActivityEvent {
  final ActivityTypeFilter type;

  const TypeFilterChanged(this.type);

  @override
  List<Object?> get props => [type];
}

/// Event dispatched when the lead dropdown selection changes.
class LeadFilterChanged extends MyActivityEvent {
  final String leadName;

  const LeadFilterChanged(this.leadName);

  @override
  List<Object?> get props => [leadName];
}
