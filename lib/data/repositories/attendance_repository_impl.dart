import '../models/attendance_models.dart';
import '../models/attendance_data.dart';
import '../models/attendance_history_model.dart';
import 'attendance_repository.dart';
import 'mock_attendance_history_data.dart';
import 'mock_attendance_timeline.dart';

/// Implementation of the [AttendanceRepository] supplying attendance data.
class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceData> getAttendanceData() async {
    return const AttendanceData(
      isCheckedIn: true,
      checkInTime: '9:02 AM',
      location: 'Calicut Branch',
      callsCount: 22,
      visitsCount: 3,
      notesCount: 8,
      hoursCount: 5.4,
      timeline: mockTimelineItems,
    );
  }

  @override
  Future<AttendanceData> checkIn(AttendanceData current) async =>
      current.copyWith(isCheckedIn: true, checkInTime: '9:02 AM');

  @override
  Future<AttendanceData> checkOut(AttendanceData current) async =>
      current.copyWith(isCheckedIn: false, checkInTime: null);

  @override
  Future<AttendanceHistoryModel> getAttendanceHistory() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return MockAttendanceHistoryData.mockHistory;
  }
}
