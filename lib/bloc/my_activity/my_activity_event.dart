import 'package:equatable/equatable.dart';
import '../../data/models/my_activity/my_activity_enums.dart';

abstract class MyActivityEvent extends Equatable {
  const MyActivityEvent();

  @override
  List<Object?> get props => [];
}

class LoadMyActivity extends MyActivityEvent {
  const LoadMyActivity();
}

class TimeFilterChanged extends MyActivityEvent {
  final ActivityTimeFilter filter;

  const TimeFilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}

class TypeFilterChanged extends MyActivityEvent {
  final ActivityTypeFilter type;

  const TypeFilterChanged(this.type);

  @override
  List<Object?> get props => [type];
}

class LeadFilterChanged extends MyActivityEvent {
  final String leadName;

  const LeadFilterChanged(this.leadName);

  @override
  List<Object?> get props => [leadName];
}
