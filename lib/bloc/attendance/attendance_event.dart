import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object?> get props => [];
}

class LoadAttendance extends AttendanceEvent {
  const LoadAttendance();
}

class CheckIn extends AttendanceEvent {
  const CheckIn();
}

class CheckOut extends AttendanceEvent {
  const CheckOut();
}
