import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/attendance_repository.dart';
import 'attendance_models.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';
part 'attendance_state_loaded.dart';

/// BLoC for managing user daily activity and attendance status.
class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  /// The attendance repository.
  final AttendanceRepository attendanceRepository;

  /// Initializes the BLoC with the initial state.
  AttendanceBloc({required this.attendanceRepository})
      : super(const AttendanceInitial()) {
    on<LoadAttendance>(_onLoadAttendance);
    on<CheckIn>(_onCheckIn);
    on<CheckOut>(_onCheckOut);
  }

  Future<void> _onLoadAttendance(
    LoadAttendance event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(const AttendanceLoading());
    try {
      final data = await attendanceRepository.getAttendanceData();
      emit(data);
    } catch (e) {
      emit(const AttendanceError(errorMessage: 'Failed to load attendance'));
    }
  }

  Future<void> _onCheckIn(CheckIn event, Emitter<AttendanceState> emit) async {
    if (state is AttendanceLoaded) {
      final current = state as AttendanceLoaded;
      emit(const AttendanceLoading());
      try {
        final data = await attendanceRepository.checkIn(current);
        emit(data);
      } catch (e) {
        emit(current);
      }
    }
  }

  Future<void> _onCheckOut(
    CheckOut event,
    Emitter<AttendanceState> emit,
  ) async {
    if (state is AttendanceLoaded) {
      final current = state as AttendanceLoaded;
      emit(const AttendanceLoading());
      try {
        final data = await attendanceRepository.checkOut(current);
        emit(data);
      } catch (e) {
        emit(current);
      }
    }
  }
}
