import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/notifications/notifications_bloc.dart';

List<BlocProvider> buildBlocProviders() {
  return [
    BlocProvider<AttendanceBloc>(
      create: (c) => AttendanceBloc(attendanceRepository: c.read()),
    ),
    BlocProvider<AccountBloc>(
      create: (c) => AccountBloc(
        accountRepository: c.read(),
        authRepository: c.read(),
      ),
    ),
    BlocProvider<NotificationsBloc>(
      create: (c) => NotificationsBloc(notificationsRepository: c.read()),
    ),
  ];
}
