part of 'attendance_bloc.dart';

/// State emitted when attendance data is loaded.
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

  /// Factory constructor to create a default/empty state.
  factory AttendanceLoaded.initial() {
    return const AttendanceLoaded(
      isCheckedIn: false,
      checkInTime: null,
      location: 'Calicut Branch',
      callsCount: 22,
      visitsCount: 3,
      notesCount: 8,
      hoursCount: 5.4,
      timeline: [],
    );
  }

  /// Utility to copy and modify state values.
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
