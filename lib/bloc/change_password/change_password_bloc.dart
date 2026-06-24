import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/password_repository.dart';

export 'change_password_event.dart';
export 'change_password_state.dart';
export 'change_password_inputs.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';
import 'change_password_inputs.dart';
import 'change_password_handlers.dart';
import 'change_password_submit_handler.dart';
import 'change_password_toggle_handlers.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final PasswordRepository authRepository;

  ChangePasswordBloc({
    required this.authRepository,
  }) : super(const ChangePasswordState()) {
    on<CurrentPasswordChanged>((e, emit) => changePasswordCurrentPasswordChanged(this, e, emit));
    on<NewPasswordChanged>((e, emit) => changePasswordNewPasswordChanged(this, e, emit));
    on<ConfirmPasswordChanged>((e, emit) => changePasswordConfirmPasswordChanged(this, e, emit));
    on<ToggleCurrentPasswordVisibility>((e, emit) => changePasswordToggleCurrentVisibility(this, emit));
    on<ToggleNewPasswordVisibility>((e, emit) => changePasswordToggleNewVisibility(this, emit));
    on<ToggleConfirmPasswordVisibility>((e, emit) => changePasswordToggleConfirmVisibility(this, emit));
    on<ChangePasswordSubmitted>((e, emit) => changePasswordSubmitted(this, e, emit));
  }
}
