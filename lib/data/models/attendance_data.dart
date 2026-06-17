import 'package:equatable/equatable.dart';
import '../../bloc/attendance/attendance_models.dart';

class AttendanceData extends Equatable {
  final bool isCheckedIn;
  final String? checkInTime;
  final String location;
  final int callsCount;
  final int visitsCount;
  final int notesCount;
  final double hoursCount;
  final List<AttendanceTimelineItem> timeline;

  const AttendanceData({
    required this.isCheckedIn,
    this.checkInTime,
    required this.location,
    required this.callsCount,
    required this.visitsCount,
    required this.notesCount,
    required this.hoursCount,
    required this.timeline,
  });

  AttendanceData copyWith({
    bool? isCheckedIn,
    String? checkInTime,
    String? location,
    int? callsCount,
    int? visitsCount,
    int? notesCount,
    double? hoursCount,
    List<AttendanceTimelineItem>? timeline,
  }) {
    return AttendanceData(
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      checkInTime: checkInTime ?? this.checkInTime,
      location: location ?? this.location,
      callsCount: callsCount ?? this.callsCount,
      visitsCount: visitsCount ?? this.visitsCount,
      notesCount: notesCount ?? this.notesCount,
      hoursCount: hoursCount ?? this.hoursCount,
      timeline: timeline ?? this.timeline,
    );
  }

  @override
  List<Object?> get props => [
        isCheckedIn,
        checkInTime,
        location,
        callsCount,
        visitsCount,
        notesCount,
        hoursCount,
        timeline,
      ];
}
