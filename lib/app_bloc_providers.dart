import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/call_log/call_log_bloc.dart';
import 'bloc/notifications/notifications_bloc.dart';
import 'bloc/deals/deals_bloc.dart';
import 'data/repositories/deals_repository.dart';
import 'utils/phone_dialer_service.dart';

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
    BlocProvider<CallLogBloc>(
      create: (c) => CallLogBloc(
        leadsRepository: c.read(),
        activityRepository: c.read(),
        dialerService: const PhoneDialerService(),
      ),
    ),
    BlocProvider<DealsBloc>(
      create: (c) => DealsBloc(dealsRepository: c.read<DealsRepository>()),
    ),
  ];
}
