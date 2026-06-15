part of 'attendance_bloc.dart';

/// Base class for all states of the Attendance BLoC.
abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Attendance flow.
class AttendanceInitial extends AttendanceState {
  const AttendanceInitial();
}

/// State emitted while fetching/updating attendance data.
class AttendanceLoading extends AttendanceState {
  const AttendanceLoading();
}

/// State emitted on error.
class AttendanceError extends AttendanceState {
  final String errorMessage;

  const AttendanceError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
