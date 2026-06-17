import '../models/attendance_data.dart';

abstract class AttendanceRepository {
  Future<AttendanceData> getAttendanceData();

  Future<AttendanceData> checkIn(AttendanceData current);

  Future<AttendanceData> checkOut(AttendanceData current);
}
