import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../bloc/leads/leads_enums.dart';
import '../../bloc/leads/leads_models.dart';
import '../../data/repositories/leads_repository.dart';
import '../../utils/phone_dialer_service.dart';

part 'call_log_event.dart';
part 'call_log_state.dart';
part 'call_log_handlers.dart';

class CallLogBloc extends Bloc<CallLogEvent, CallLogState> {
  final LeadsRepository leadsRepository;
  final PhoneDialerService dialerService;

  CallLogBloc({
    required this.leadsRepository,
    this.dialerService = const PhoneDialerService(),
  }) : super(const CallLogInitial()) {
    on<InitiateCall>(_onInitiateCall);
    on<InitiateCallByName>(_onInitiateCallByName);
    on<AppReturnedFromCall>(_onAppReturnedFromCall);
    on<SaveCallLog>(_onSaveCallLog);
    on<ResetCallLog>(_onResetCallLog);
  }
}
