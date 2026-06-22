import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/password_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';
part 'change_password_inputs.dart';
part 'change_password_handlers.dart';
part 'change_password_toggle_handlers.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final PasswordRepository authRepository;

  ChangePasswordBloc({
    required this.authRepository,
  }) : super(const ChangePasswordState()) {
    on<CurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ToggleCurrentPasswordVisibility>(_onToggleCurrentPasswordVisibility);
    on<ToggleNewPasswordVisibility>(_onToggleNewPasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<ChangePasswordSubmitted>(_onSubmitted);
  }
}
