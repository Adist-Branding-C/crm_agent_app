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

enum AttendanceFailure { load, unknown }

/// State emitted on error.
class AttendanceError extends AttendanceState {
  final AttendanceFailure failure;

  const AttendanceError({required this.failure});

  String get errorMessage {
    switch (failure) {
      case AttendanceFailure.load: return 'Failed to load attendance';
      case AttendanceFailure.unknown: return 'An error occurred';
    }
  }

  @override
  List<Object?> get props => [failure];
}
