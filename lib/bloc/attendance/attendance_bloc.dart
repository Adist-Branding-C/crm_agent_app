import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/attendance_repository.dart';
import 'attendance_event.dart';
import 'attendance_mappers.dart';
import 'attendance_state.dart';
import 'attendance_state_loaded.dart';

export 'attendance_event.dart';
export 'attendance_state.dart';
export 'attendance_state_loaded.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository attendanceRepository;

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
      emit(data.toState());
    } catch (e) {
      emit(const AttendanceError(failure: AttendanceFailure.load));
    }
  }

  Future<void> _onCheckIn(CheckIn event, Emitter<AttendanceState> emit) async {
    if (state is AttendanceLoaded) {
      final current = state as AttendanceLoaded;
      emit(const AttendanceLoading());
      try {
        final data = await attendanceRepository.checkIn(current.toData());
        emit(data.toState());
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
        final data = await attendanceRepository.checkOut(current.toData());
        emit(data.toState());
      } catch (e) {
        emit(current);
      }
    }
  }
}
