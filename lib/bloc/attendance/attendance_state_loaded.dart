import '../../data/models/attendance_data.dart';
import 'attendance_models.dart';
import 'attendance_state.dart';

class AttendanceLoaded extends AttendanceState {
  final bool isCheckedIn;
  final String? checkInTime;
  final String location;
  final int callsCount;
  final int visitsCount;
  final int notesCount;
  final double hoursCount;
  final List<AttendanceTimelineItem> timeline;

  const AttendanceLoaded({
    required this.isCheckedIn,
    this.checkInTime,
    required this.location,
    required this.callsCount,
    required this.visitsCount,
    required this.notesCount,
    required this.hoursCount,
    required this.timeline,
  });

  AttendanceData toData() => AttendanceData(
    isCheckedIn: isCheckedIn, checkInTime: checkInTime,
    location: location, callsCount: callsCount,
    visitsCount: visitsCount, notesCount: notesCount,
    hoursCount: hoursCount, timeline: timeline,
  );

  AttendanceLoaded copyWith({
    bool? isCheckedIn, String? checkInTime, String? location,
    int? callsCount, int? visitsCount, int? notesCount,
    double? hoursCount, List<AttendanceTimelineItem>? timeline,
  }) => AttendanceLoaded(
    isCheckedIn: isCheckedIn ?? this.isCheckedIn,
    checkInTime: checkInTime ?? this.checkInTime,
    location: location ?? this.location,
    callsCount: callsCount ?? this.callsCount,
    visitsCount: visitsCount ?? this.visitsCount,
    notesCount: notesCount ?? this.notesCount,
    hoursCount: hoursCount ?? this.hoursCount,
    timeline: timeline ?? this.timeline,
  );

  @override
  List<Object?> get props => [
    isCheckedIn, checkInTime, location, callsCount,
    visitsCount, notesCount, hoursCount, timeline,
  ];
}
