import '../../bloc/attendance/attendance_bloc.dart';

/// Repository interface managing Daily activity & Attendance.
abstract class AttendanceRepository {
  /// Fetches the current user attendance details.
  Future<AttendanceLoaded> getAttendanceData();

  /// Updates status to checked in.
  Future<AttendanceLoaded> checkIn(AttendanceLoaded current);

  /// Updates status to checked out.
  Future<AttendanceLoaded> checkOut(AttendanceLoaded current);
}
