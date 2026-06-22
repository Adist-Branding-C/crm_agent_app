import 'package:go_router/go_router.dart';
import '../screens/attendance_history/attendance_history_screen.dart';
import 'app_routes.dart';

/// Builds the Attendance History route for the application.
GoRoute buildAttendanceHistoryRoute() {
  return GoRoute(
    name: AppRoutes.attendanceHistory,
    path: AppRoutes.attendanceHistoryPath,
    builder: (context, state) => const AttendanceHistoryScreen(),
  );
}
