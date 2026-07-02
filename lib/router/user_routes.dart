import 'package:go_router/go_router.dart';
import '../screens/account/account_screen.dart';
import '../screens/account/edit_profile/edit_profile_screen.dart';
import '../screens/attendance/attendance_screen.dart';
import '../screens/call_log/widgets/call_log_route_provider.dart';
import '../screens/call_report/call_report_screen.dart';
import '../screens/change_password/change_password_screen.dart';
import '../screens/enquiry_details/enquiry_details_screen.dart';
import '../screens/follow_ups/follow_ups_screen.dart';
import '../screens/my_activity/my_activity_screen.dart';
import '../screens/tasks/task_details_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/font_settings_screen.dart';
import 'app_routes.dart';

/// Builds the routes relating to the user account, tasks, logs, and activity.
List<RouteBase> buildUserRoutes() {
  return [
    GoRoute(name: AppRoutes.attendance, path: AppRoutes.attendancePath, builder: (c, s) => const AttendanceScreen()),
    GoRoute(name: AppRoutes.followUps, path: AppRoutes.followUpsPath, builder: (c, s) => const FollowUpsScreen()),
    GoRoute(name: AppRoutes.account, path: AppRoutes.accountPath, builder: (c, s) => const AccountScreen()),
    GoRoute(name: AppRoutes.enquiryDetails, path: AppRoutes.enquiryDetailsPath, builder: (c, s) => EnquiryDetailsScreen(leadId: s.pathParameters['id'] ?? '')),
    GoRoute(name: AppRoutes.taskDetails, path: AppRoutes.taskDetailsPath, builder: (c, s) => TaskDetailsScreen(taskId: s.pathParameters['id'] ?? '')),
    GoRoute(name: AppRoutes.callLog, path: AppRoutes.callLogPath, builder: (c, s) => CallLogRouteProvider(state: s)),
    GoRoute(name: AppRoutes.callReport, path: AppRoutes.callReportPath, builder: (c, s) => const CallReportScreen()),
    GoRoute(name: AppRoutes.myActivity, path: AppRoutes.myActivityPath, builder: (c, s) => const MyActivityScreen()),
    GoRoute(name: AppRoutes.changePassword, path: AppRoutes.changePasswordPath, builder: (c, s) => const ChangePasswordScreen()),
    GoRoute(name: AppRoutes.editProfile, path: AppRoutes.editProfilePath, builder: (c, s) => const EditProfileScreen()),
    GoRoute(name: AppRoutes.settings, path: AppRoutes.settingsPath, builder: (c, s) => const SettingsScreen()),
    GoRoute(name: AppRoutes.fontSettings, path: AppRoutes.fontSettingsPath, builder: (c, s) => const FontSettingsScreen()),
  ];
}
