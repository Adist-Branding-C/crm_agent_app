import 'package:equatable/equatable.dart';

/// Data model representing a single day's attendance log in the history list.
class AttendanceHistoryLogModel extends Equatable {
  final int day;
  final String dayName;
  final String status;
  final bool isActive;
  final String? checkInTime;
  final String? checkOutTime;
  final String? hours;
  final String? location;
  final bool isGpsVerified;
  final String? note;
  final String? approvedBy;

  /// Creates a constant [AttendanceHistoryLogModel].
  const AttendanceHistoryLogModel({
    required this.day,
    required this.dayName,
    required this.status,
    this.isActive = false,
    this.checkInTime,
    this.checkOutTime,
    this.hours,
    this.location,
    this.isGpsVerified = false,
    this.note,
    this.approvedBy,
  });

  @override
  List<Object?> get props => [
        day,
        dayName,
        status,
        isActive,
        checkInTime,
        checkOutTime,
        hours,
        location,
        isGpsVerified,
        note,
        approvedBy,
      ];
}
