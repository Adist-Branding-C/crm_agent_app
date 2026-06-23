import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/call_log/call_log_bloc.dart';
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
  ];
}
