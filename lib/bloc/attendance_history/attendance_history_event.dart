import 'package:equatable/equatable.dart';

/// Base event class for the Attendance History BLoC.
abstract class AttendanceHistoryEvent extends Equatable {
  const AttendanceHistoryEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggering the load of the monthly attendance history details.
class LoadAttendanceHistory extends AttendanceHistoryEvent {
  const LoadAttendanceHistory();
}
