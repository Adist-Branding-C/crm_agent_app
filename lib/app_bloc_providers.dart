import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/call_log/call_log_bloc.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'bloc/tasks/tasks_bloc.dart';
import 'bloc/notifications/notifications_bloc.dart';

/// Builds the list of global BLoC providers for session-scoped state.
List<BlocProvider> buildBlocProviders() {
  return [
    BlocProvider<CallLogBloc>(
      create: (c) => CallLogBloc(leadsRepository: c.read()),
    ),
    BlocProvider<AttendanceBloc>(
      create: (c) => AttendanceBloc(
        attendanceRepository: c.read(),
      )..add(const LoadAttendance()),
    ),
    BlocProvider<AccountBloc>(
      create: (c) => AccountBloc(
        accountRepository: c.read(),
        authRepository: c.read(),
      )..add(const LoadAccount()),
    ),
    BlocProvider<TasksBloc>(
      create: (c) => TasksBloc(
        tasksRepository: c.read(),
      )..add(const LoadTasks()),
    ),
    BlocProvider<NotificationsBloc>(
      create: (c) => NotificationsBloc(
        notificationsRepository: c.read(),
      )..add(const LoadNotifications()),
    ),
  ];
}
