import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/session_repository.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'login_inputs.dart';

export 'login_event.dart';
export 'login_state.dart';
export 'login_inputs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) => emit(state.copyWith(obscurePassword: !state.obscurePassword));

  void _onPhoneChanged(PhoneChanged event, Emitter<LoginState> emit) {
    final phone = LoginPhone.dirty(event.phone);
    emit(state.copyWith(phone: phone, clearAuthFailure: true));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = LoginPassword.dirty(event.password);
    emit(state.copyWith(password: password));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
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

    emit(state.copyWith(isLoading: true));
    try {
      final ok = await authRepository.login(phone.value, password.value);
      emit(state.copyWith(isSuccess: ok, isLoading: false));
    } on AuthDomainException catch (e) {
      emit(state.copyWith(
        authFailure: e.isNetworkError
            ? AuthFailure.network
            : AuthFailure.invalidCredentials,
        authErrorMessage: e.isNetworkError ? null : e.message,
        isSuccess: false,
        isLoading: false,
      ));
    } catch (_) {
      emit(state.copyWith(
        authFailure: AuthFailure.unknown,
        isSuccess: false,
        isLoading: false,
      ));
    }
  }
}

