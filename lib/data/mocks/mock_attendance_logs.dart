import '../models/attendance_history_log_model.dart';

const mockAttendanceLogs = [
  AttendanceHistoryLogModel(day: 12, dayName: 'TUE', status: 'Present', isActive: true, checkInTime: '9:02 AM', checkOutTime: '—', hours: 'Ongoing', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 11, dayName: 'MON', status: 'Present', checkInTime: '9:00 AM', checkOutTime: '6:38 PM', hours: '9h 38m', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 9, dayName: 'SAT', status: 'Half Day', checkInTime: '9:20 AM', checkOutTime: '2:30 PM', hours: '5h 10m', location: 'Field - Kochi', isGpsVerified: true, note: 'Half day - campus visit, Edappally'),
  AttendanceHistoryLogModel(day: 8, dayName: 'FRI', status: 'Present', checkInTime: '9:10 AM', checkOutTime: '7:05 PM', hours: '9h 55m', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 7, dayName: 'THU', status: 'Present', checkInTime: '9:01 AM', checkOutTime: '6:40 PM', hours: '9h 39m', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 6, dayName: 'WED', status: 'Late', checkInTime: '10:18 AM', checkOutTime: '6:50 PM', hours: '8h 32m', location: 'Calicut Branch', isGpsVerified: true, note: 'Late arrival - regularised (traffic)'),
  AttendanceHistoryLogModel(day: 5, dayName: 'TUE', status: 'On Leave', location: '—', note: 'Casual leave', approvedBy: 'Approved by Branch Head'),
  AttendanceHistoryLogModel(day: 4, dayName: 'MON', status: 'Present', checkInTime: '9:05 AM', checkOutTime: '6:30 PM', hours: '9h 25m', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 3, dayName: 'SUN', status: 'Week Off'),
  AttendanceHistoryLogModel(day: 2, dayName: 'SAT', status: 'Late', checkInTime: '10:05 AM', checkOutTime: '6:15 PM', hours: '8h 10m', location: 'Calicut Branch', isGpsVerified: true),
  AttendanceHistoryLogModel(day: 1, dayName: 'FRI', status: 'Holiday'),
];
