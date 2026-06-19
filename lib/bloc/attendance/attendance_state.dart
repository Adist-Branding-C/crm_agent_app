import 'package:equatable/equatable.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object?> get props => [];
}

class AttendanceInitial extends AttendanceState {
  const AttendanceInitial();
}

class AttendanceLoading extends AttendanceState {
  const AttendanceLoading();
}

enum AttendanceFailure { load, unknown }

class AttendanceError extends AttendanceState {
  final AttendanceFailure failure;

  const AttendanceError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
