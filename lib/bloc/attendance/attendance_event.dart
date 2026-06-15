part of 'attendance_bloc.dart';

/// Base class for all Attendance BLoC events.
abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load attendance data.
class LoadAttendance extends AttendanceEvent {
  const LoadAttendance();
}

/// Event triggered to punch in / check in.
class CheckIn extends AttendanceEvent {
  const CheckIn();
}

/// Event triggered to punch out / check out.
class CheckOut extends AttendanceEvent {
  const CheckOut();
}
