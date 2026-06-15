import 'package:equatable/equatable.dart';

/// Represents a type of daily activity in the timeline.
enum AttendanceActivityType {
  checkIn,
  call,
  note,
  lead,
  lunchBreak,
  statusChange,
  dealWon,
}

/// Model representing a single timeline activity event.
class AttendanceTimelineItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final AttendanceActivityType type;

  const AttendanceTimelineItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
  });

  @override
  List<Object?> get props => [id, title, subtitle, time, type];
}
