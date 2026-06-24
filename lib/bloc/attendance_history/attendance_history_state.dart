import 'package:equatable/equatable.dart';
import '../../data/models/attendance_history_model.dart';

/// Base state class for the Attendance History BLoC.
abstract class AttendanceHistoryState extends Equatable {
  const AttendanceHistoryState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Attendance History BLoC.
class AttendanceHistoryInitial extends AttendanceHistoryState {
  const AttendanceHistoryInitial();
}

/// State representing that the attendance history is loading.
class AttendanceHistoryLoading extends AttendanceHistoryState {
  const AttendanceHistoryLoading();
}

/// State representing that the attendance history has loaded successfully.
class AttendanceHistoryLoaded extends AttendanceHistoryState {
  final AttendanceHistoryModel history;

  const AttendanceHistoryLoaded(this.history);

  @override
  List<Object?> get props => [history];
}

/// State representing that an error occurred while loading.
class AttendanceHistoryError extends AttendanceHistoryState {
  final String message;

  const AttendanceHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
