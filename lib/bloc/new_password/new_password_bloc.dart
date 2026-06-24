import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/password_repository.dart';

export 'new_password_event.dart';
export 'new_password_state.dart';
export 'new_password_inputs.dart';
import 'new_password_event.dart';
import 'new_password_state.dart';
import 'new_password_inputs.dart';
import 'new_password_handlers.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  final PasswordRepository authRepository;
  final String phone;

  NewPasswordBloc({required this.authRepository, required this.phone})
    : super(const NewPasswordState()) {
    on<NewPasswordChanged>((e, emit) => newPasswordChanged(this, e, emit));
    on<NewConfirmPasswordChanged>(
      (e, emit) => newConfirmPasswordChanged(this, e, emit),
    );
    on<ToggleNewPasswordVisibility>(
      (e, emit) => newToggleNewPasswordVisibility(this, emit),
    );
    on<ToggleConfirmPasswordVisibility>(
      (e, emit) => newToggleConfirmPasswordVisibility(this, emit),
    );
    on<NewPasswordSubmitted>((e, emit) => newPasswordSubmitted(this, e, emit));
  }
}
