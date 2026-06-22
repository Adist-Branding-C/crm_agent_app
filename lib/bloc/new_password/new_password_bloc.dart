import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/auth_repository.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';
part 'new_password_inputs.dart';
part 'new_password_handlers.dart';

/// BLoC that manages state transitions and validation on the New Password screen.
class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  final AuthRepository authRepository;
  final String phone;

  NewPasswordBloc({
    required this.authRepository,
    required this.phone,
  }) : super(const NewPasswordState()) {
    on<NewPasswordChanged>(_onPasswordChanged);
    on<NewConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ToggleNewPasswordVisibility>(_onToggleNewPasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<NewPasswordSubmitted>(_onSubmitted);
  }
}
