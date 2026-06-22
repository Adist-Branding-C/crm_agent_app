import '../models/attendance_data.dart';
import '../models/attendance_history_model.dart';

abstract class AttendanceRepository {
  Future<AttendanceData> getAttendanceData();

  Future<AttendanceData> checkIn(AttendanceData current);

  Future<AttendanceData> checkOut(AttendanceData current);

  Future<AttendanceHistoryModel> getAttendanceHistory();
}
