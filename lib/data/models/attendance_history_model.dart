import 'package:equatable/equatable.dart';
import 'attendance_history_log_model.dart';

/// Data model representing monthly summary stats and attendance history records.
class AttendanceHistoryModel extends Equatable {
  final String month;
  final String branch;
  final int presentDays;
  final int totalWorkingDays;
  final double attendanceRate;
  final String avgHoursPerDay;
  final double onTimeRate;
  final String totalLoggedHours;
  final String? checkedInSince;
  final String checkInLocation;
  final bool gpsVerified;
  final int lateCount;
  final int halfDayCount;
  final int leaveCount;
  final int casualLeavesLeft;
  final String avgCheckInTime;
  final String avgCheckOutTime;
  final List<AttendanceHistoryLogModel> logs;

  /// Creates a constant [AttendanceHistoryModel].
  const AttendanceHistoryModel({
    required this.month,
    required this.branch,
    required this.presentDays,
    required this.totalWorkingDays,
    required this.attendanceRate,
    required this.avgHoursPerDay,
    required this.onTimeRate,
    required this.totalLoggedHours,
    this.checkedInSince,
    required this.checkInLocation,
    required this.gpsVerified,
    required this.lateCount,
    required this.halfDayCount,
    required this.leaveCount,
    required this.casualLeavesLeft,
    required this.avgCheckInTime,
    required this.avgCheckOutTime,
    required this.logs,
  });

  @override
  List<Object?> get props => [
        month, branch, presentDays, totalWorkingDays, attendanceRate,
        avgHoursPerDay, onTimeRate, totalLoggedHours, checkedInSince,
        checkInLocation, gpsVerified, lateCount, halfDayCount, leaveCount,
        casualLeavesLeft, avgCheckInTime, avgCheckOutTime, logs,
      ];
}
