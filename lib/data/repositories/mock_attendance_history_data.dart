import '../models/attendance_history_model.dart';
import '../mocks/mock_attendance_logs.dart';

class MockAttendanceHistoryData {
  MockAttendanceHistoryData._();
  static const mockHistory = AttendanceHistoryModel(
    month: 'May 2026',
    branch: 'Calicut Branch',
    presentDays: 8,
    totalWorkingDays: 9,
    attendanceRate: 89.0,
    avgHoursPerDay: '8h 41m',
    onTimeRate: 86.0,
    totalLoggedHours: '69h',
    checkedInSince: '9:02 AM',
    checkInLocation: 'Calicut Branch',
    gpsVerified: true,
    lateCount: 1,
    halfDayCount: 2,
    leaveCount: 1,
    casualLeavesLeft: 6,
    avgCheckInTime: '9:11 AM',
    avgCheckOutTime: '6:29 PM',
    logs: mockAttendanceLogs,
  );
}
