import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/session_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_inputs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionRepository authRepository;

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
      clearAuthFailure: true,
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
      clearAuthFailure: true,
    ));

    if (phone.isNotValid || password.isNotValid) {
      emit(state.copyWith(isSuccess: false));
      return;
    }

    try {
      final ok = await authRepository.login(phone.value, password.value);
      emit(state.copyWith(isSuccess: ok));
    } catch (_) {
      emit(state.copyWith(authFailure: AuthFailure.invalidCredentials, isSuccess: false));
    }
  }
}
