import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/activity_repository.dart';
import '../../data/repositories/leads_repository.dart';
import '../../utils/phone_dialer_service.dart';

import 'call_log_event.dart';
import 'call_log_state.dart';
import 'call_log_handlers.dart';

export 'call_log_event.dart';
export 'call_log_state.dart';

class CallLogBloc extends Bloc<CallLogEvent, CallLogState> {
  final LeadsRepository leadsRepository;
  final ActivityRepository activityRepository;
  final PhoneDialerService dialerService;

  CallLogBloc({
    required this.leadsRepository,
    required this.activityRepository,
    required this.dialerService,
  }) : super(const CallLogInitial()) {
    on<InitiateCall>(onInitiateCall);
    on<InitiateCallByName>(onInitiateCallByName);
    on<AppReturnedFromCall>(onAppReturnedFromCall);
    on<SaveCallLog>(onSaveCallLog);
    on<ResetCallLog>(onResetCallLog);
  }
}
