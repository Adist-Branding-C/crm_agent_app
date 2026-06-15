import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../dashboard/dashboard_screen.dart';
import 'widgets/login_body.dart';

/// The authentication screen that allows agents to sign in.
class LoginScreen extends StatefulWidget {
  /// Creates a constant [LoginScreen] widget.
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          }
        },
        child: Scaffold(
          body: LoginBody(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ),
      ),
    );
  }
}
