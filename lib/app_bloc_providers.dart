import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/call_log/call_log_bloc.dart';
import 'bloc/notifications/notifications_bloc.dart';
import 'utils/phone_dialer_service.dart';

List<BlocProvider> buildBlocProviders() {
  return [
    BlocProvider<CallLogBloc>(
      create: (c) => CallLogBloc(
        leadsRepository: c.read(),
        activityRepository: c.read(),
        dialerService: const PhoneDialerService(),
      ),
    ),
    BlocProvider<AttendanceBloc>(
      create: (c) =>
          AttendanceBloc(attendanceRepository: c.read())
            ..add(const LoadAttendance()),
    ),
    BlocProvider<AccountBloc>(
      create: (c) =>
          AccountBloc(accountRepository: c.read(), authRepository: c.read())
            ..add(const LoadAccount()),
    ),
    BlocProvider<NotificationsBloc>(
      create: (c) =>
          NotificationsBloc(notificationsRepository: c.read())
            ..add(const LoadNotifications()),
    ),
  ];
}
