import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/notifications/notifications_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../data/repositories/session_repository.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/login_body.dart';

/// The authentication screen that allows agents to sign in.
class LoginScreen extends StatefulWidget {
  /// Creates a constant [LoginScreen] widget.
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LoginBloc(authRepository: context.read<SessionRepository>()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.read<AccountBloc>().add(const LoadAccount());
            context.read<NotificationsBloc>().add(const LoadNotifications());
            context.read<AuthStateNotifier>().refresh();
          }
        },
        child: PageScaffold(
          padding: EdgeInsets.only(
           left: AppSpacing.xl-2,
           right: AppSpacing.xl-2,
           top: AppSpacing.massive,
          ),
          child: LoginBody(
            phoneController: _phoneController,
            passwordController: _passwordController,
          ),
        ),
      ),
    );
  }
}
