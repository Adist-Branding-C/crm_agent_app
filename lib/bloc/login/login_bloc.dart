import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_validator.dart';

part 'login_event.dart';
part 'login_state.dart';

/// BLoC that manages state transitions and validations on the Login Screen.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// Initializes the BLoC with the initial [LoginState].
  LoginBloc() : super(const LoginState()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<LoginState> emit) {
    final phone = event.phone;
    final error = phone.isNotEmpty ? LoginValidator.validatePhone(phone) : null;
    final filteredError = error == 'Phone number is required.' ? null : error;
    emit(
      state.copyWith(
        phone: phone,
        phoneError: filteredError,
        clearPhoneError: filteredError == null,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    final error = password.isNotEmpty
        ? LoginValidator.validatePassword(password)
        : null;
    final filteredError = error == 'Password is required.' ? null : error;
    emit(
      state.copyWith(
        password: password,
        passwordError: filteredError,
        clearPasswordError: filteredError == null,
      ),
    );
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
    final phoneError = LoginValidator.validatePhone(state.phone);
    final passwordError = LoginValidator.validatePassword(state.password);

    if (phoneError != null || passwordError != null) {
      emit(
        state.copyWith(
          phoneError: phoneError,
          passwordError: passwordError,
          clearPhoneError: phoneError == null,
          clearPasswordError: passwordError == null,
          isSuccess: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          clearPhoneError: true,
          clearPasswordError: true,
          isSuccess: true,
        ),
      );
    }
  }
}
