import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/attendance_history_model.dart';
import '../../data/repositories/attendance_repository.dart';

part 'attendance_history_event.dart';
part 'attendance_history_state.dart';

/// BLoC that manages states and business logic of the Attendance History Screen.
class AttendanceHistoryBloc
    extends Bloc<AttendanceHistoryEvent, AttendanceHistoryState> {
  final AttendanceRepository repository;

  /// Creates an [AttendanceHistoryBloc] with the initial state.
  AttendanceHistoryBloc({required this.repository})
      : super(const AttendanceHistoryInitial()) {
    on<LoadAttendanceHistory>(_onLoadAttendanceHistory);
  }

  Future<void> _onLoadAttendanceHistory(
    LoadAttendanceHistory event,
    Emitter<AttendanceHistoryState> emit,
  ) async {
    emit(const AttendanceHistoryLoading());
    try {
      final history = await repository.getAttendanceHistory();
      emit(AttendanceHistoryLoaded(history));
    } catch (_) {
      emit(const AttendanceHistoryError('Failed to load attendance history'));
    }
  }
}
