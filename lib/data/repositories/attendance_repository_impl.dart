import '../../bloc/attendance/attendance_models.dart';
import '../models/attendance_data.dart';
import '../models/attendance_history_model.dart';
import 'attendance_repository.dart';
import 'mock_attendance_history_data.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  static const _mockTimeline = [
    AttendanceTimelineItem(
      id: '1', title: 'Checked in',
      subtitle: 'Calicut Branch · GPS verified',
      time: '9:02 AM', type: AttendanceActivityType.checkIn,
    ),
    AttendanceTimelineItem(
      id: '2', title: 'Call logged — Rahul Menon',
      subtitle: 'Outbound · 6 min · Interested',
      time: '9:24 AM', type: AttendanceActivityType.call,
    ),
    AttendanceTimelineItem(
      id: '3', title: 'Note added — Sneha Pillai',
      subtitle: '"Needs pricing sheet"',
      time: '10:10 AM', type: AttendanceActivityType.note,
    ),
    AttendanceTimelineItem(
      id: '4', title: 'New lead assigned',
      subtitle: 'Divya Raveendran · Instagram',
      time: '11:05 AM', type: AttendanceActivityType.lead,
    ),
    AttendanceTimelineItem(
      id: '5', title: 'Lunch break',
      subtitle: '30 min',
      time: '12:30 PM', type: AttendanceActivityType.lunchBreak,
    ),
    AttendanceTimelineItem(
      id: '6', title: 'Status changed — Anjali Suresh',
      subtitle: 'Follow Up → Interested',
      time: '1:45 PM', type: AttendanceActivityType.statusChange,
    ),
    AttendanceTimelineItem(
      id: '7', title: 'Deal won',
      subtitle: 'Diploma — Lakshmi W. · ₹65,000',
      time: '2:35 PM', type: AttendanceActivityType.dealWon,
    ),
  ];

  @override
  Future<AttendanceData> getAttendanceData() async {
    return const AttendanceData(
      isCheckedIn: true,
      checkInTime: '9:02 AM',
      location: 'Calicut Branch',
      callsCount: 22,
      visitsCount: 3,
      notesCount: 8,
      hoursCount: 5.4,
      timeline: _mockTimeline,
    );
  }

  @override
  Future<AttendanceData> checkIn(AttendanceData current) async =>
      current.copyWith(isCheckedIn: true, checkInTime: '9:02 AM');

  @override
  Future<AttendanceData> checkOut(AttendanceData current) async =>
      current.copyWith(isCheckedIn: false, checkInTime: null);

  @override
  Future<AttendanceHistoryModel> getAttendanceHistory() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return MockAttendanceHistoryData.mockHistory;
  }
}
