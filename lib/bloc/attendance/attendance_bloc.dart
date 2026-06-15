import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'attendance_mock.dart';
import 'attendance_models.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';
part 'attendance_state_loaded.dart';

/// BLoC for managing user daily activity and attendance status.
class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  /// Initializes the BLoC with the initial state.
  AttendanceBloc() : super(const AttendanceInitial()) {
    on<LoadAttendance>(_onLoadAttendance);
    on<CheckIn>(_onCheckIn);
    on<CheckOut>(_onCheckOut);
  }

  Future<void> _onLoadAttendance(
    LoadAttendance event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(const AttendanceLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      AttendanceLoaded(
        isCheckedIn: false,
        checkInTime: null,
        location: 'Calicut Branch',
        callsCount: 22,
        visitsCount: 3,
        notesCount: 8,
        hoursCount: 5.4,
        timeline: mockAttendanceTimeline,
      ),
    );
  }

  Future<void> _onCheckIn(CheckIn event, Emitter<AttendanceState> emit) async {
    if (state is AttendanceLoaded) {
      final current = state as AttendanceLoaded;
      emit(const AttendanceLoading());
      await Future.delayed(const Duration(milliseconds: 200));
      emit(current.copyWith(isCheckedIn: true, checkInTime: '9:02 AM'));
    }
  }

  Future<void> _onCheckOut(
    CheckOut event,
    Emitter<AttendanceState> emit,
  ) async {
    if (state is AttendanceLoaded) {
      final current = state as AttendanceLoaded;
      emit(const AttendanceLoading());
      await Future.delayed(const Duration(milliseconds: 200));
      emit(current.copyWith(isCheckedIn: false, checkInTime: null));
    }
  }
}
