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

  factory AttendanceLoaded.fromData(AttendanceData data) => AttendanceLoaded(
    isCheckedIn: data.isCheckedIn,
    checkInTime: data.checkInTime,
    location: data.location,
    callsCount: data.callsCount,
    visitsCount: data.visitsCount,
    notesCount: data.notesCount,
    hoursCount: data.hoursCount,
    timeline: data.timeline,
  );

  AttendanceData toData() => AttendanceData(
    isCheckedIn: isCheckedIn,
    checkInTime: checkInTime,
    location: location,
    callsCount: callsCount,
    visitsCount: visitsCount,
    notesCount: notesCount,
    hoursCount: hoursCount,
    timeline: timeline,
  );

  factory AttendanceLoaded.initial() {
    return const AttendanceLoaded(
      isCheckedIn: false, checkInTime: null,
      location: 'Calicut Branch', callsCount: 22,
      visitsCount: 3, notesCount: 8, hoursCount: 5.4,
      timeline: [],
    );
  }

  AttendanceLoaded copyWith({
    bool? isCheckedIn,
    String? checkInTime,
    String? location,
    int? callsCount,
    int? visitsCount,
    int? notesCount,
    double? hoursCount,
    List<AttendanceTimelineItem>? timeline,
  }) {
    return AttendanceLoaded(
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
    isCheckedIn, checkInTime, location, callsCount,
    visitsCount, notesCount, hoursCount, timeline,
  ];
}
