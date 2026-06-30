/// Centralized route names and paths for the CRM Agent application.
class AppRoutes {
  AppRoutes._();

  static const splash = 'splash';
  static const login = 'login';
  static const dashboard = 'dashboard';
  static const addLead = 'addLead';
  static const deals = 'deals';
  static const analytics = 'analytics';
  static const attendance = 'attendance';
  static const followUps = 'followUps';
  static const campaigns = 'campaigns';
  static const account = 'account';
  static const enquiryDetails = 'enquiryDetails';
  static const editEnquiry = 'editEnquiry';
  static const addTask = 'addTask';
  static const notifications = 'notifications';
  static const taskDetails = 'taskDetails';
  static const callLog = 'callLog';
  static const callReport = 'callReport';
  static const myActivity = 'myActivity';
  static const viewCallLog = 'viewCallLog';
  static const settings = 'settings';
  static const fontSettings = 'fontSettings';
  static const privacyPolicy = 'privacyPolicy';

  static const splashPath = '/splash';
  static const loginPath = '/login';
  static const dashboardPath = '/dashboard';
  static const addLeadPath = '/add-lead';
  static const dealsPath = '/deals';
  static const analyticsPath = '/analytics';
  static const attendancePath = '/attendance';
  static const followUpsPath = '/follow-up-calls';
  static const campaignsPath = '/campaigns';
  static const accountPath = '/account';
  static const enquiryDetailsPath = '/enquiry-details/:id';
  static const editEnquiryPath = '/enquiry-details/:id/edit';
  static const addTaskPath = '/add-task';
  static const notificationsPath = '/notifications';
  static const taskDetailsPath = '/task-details/:id';
  static const callLogPath = '/call-log';
  static const callReportPath = '/call-report';
  static const myActivityPath = '/my-activity';
  static const viewCallLogPath = '/view-call-log';
  static const settingsPath = '/settings';
  static const fontSettingsPath = '/settings/font-settings';
  static const privacyPolicyPath = '/privacy-policy';

  static const _authPaths = <String>{
    loginPath,
    splashPath,
    forgotPasswordPath,
    verifyOtpPath,
    newPasswordPath,
  };

  static bool isAuthRoute(String path) => _authPaths.contains(path);

  static const forgotPassword = 'forgotPassword';
  static const verifyOtp = 'verifyOtp';
  static const newPassword = 'newPassword';
  static const changePassword = 'changePassword';
  static const editProfile = 'editProfile';
  static const attendanceHistory = 'attendanceHistory';

  static const forgotPasswordPath = '/forgot-password';
  static const verifyOtpPath = '/verify-otp';
  static const newPasswordPath = '/new-password';
  static const changePasswordPath = '/change-password';
  static const editProfilePath = '/account/edit';
  static const attendanceHistoryPath = '/attendance-history';
}
