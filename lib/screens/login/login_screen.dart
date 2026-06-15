import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../data/repositories/auth_repository.dart';
import 'widgets/login_body.dart';

/// The authentication screen that allows agents to sign in.
class LoginScreen extends StatefulWidget {
  /// The authentication repository.
  final AuthRepository? authRepository;

  /// Creates a constant [LoginScreen] widget.
  const LoginScreen({super.key, this.authRepository});

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
    final repo = widget.authRepository ?? context.read<AuthRepository>();

    return BlocProvider(
      create: (_) => LoginBloc(authRepository: repo),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.read<AuthStateNotifier>().refresh();
          }
        },
        child: Scaffold(
          body: LoginBody(
            phoneController: _phoneController,
            passwordController: _passwordController,
          ),
        ),
      ),
    );
  }
}
