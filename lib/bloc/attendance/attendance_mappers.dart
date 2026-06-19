import '../../data/models/attendance_data.dart';
import 'attendance_state_loaded.dart';

extension AttendanceDataX on AttendanceData {
  AttendanceLoaded toState() => AttendanceLoaded(
    isCheckedIn: isCheckedIn, checkInTime: checkInTime,
    location: location, callsCount: callsCount,
    visitsCount: visitsCount, notesCount: notesCount,
    hoursCount: hoursCount, timeline: timeline,
  );
}
