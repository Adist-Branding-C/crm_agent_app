import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/constants.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_inputs.dart';

/// BLoC that manages state transitions and validations on the Login Screen.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// The authentication repository.
  final AuthRepository authRepository;

  /// Initializes the BLoC with the initial [LoginState].
  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<LoginState> emit) =>
      emit(state.copyWith(obscurePassword: !state.obscurePassword));

  void _onPhoneChanged(PhoneChanged event, Emitter<LoginState> emit) {
    final phone = LoginPhone.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      clearPhoneErrorMsg: true,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = LoginPassword.dirty(event.password);
    emit(state.copyWith(
      password: password,
    ));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final phone = LoginPhone.dirty(state.phone.value);
    final password = LoginPassword.dirty(state.password.value);

    emit(state.copyWith(
      phone: phone,
      password: password,
      isSubmitted: true,
      clearPhoneErrorMsg: true,
    ));

    if (phone.isNotValid || password.isNotValid) {
      emit(state.copyWith(isSuccess: false));
      return;
    }

    try {
      final ok = await authRepository.login(phone.value, password.value);
      emit(state.copyWith(isSuccess: ok));
    } catch (_) {
      emit(state.copyWith(phoneErrorMsg: AppStrings.authFailed, isSuccess: false));
    }
  }
}
