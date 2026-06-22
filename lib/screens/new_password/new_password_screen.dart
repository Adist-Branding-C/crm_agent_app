import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/new_password/new_password_bloc.dart';
import '../../data/repositories/password_repository.dart';
import '../../router/app_routes.dart';
import 'widgets/new_password_body.dart';

/// Screen container for the New Password setting flow.
class NewPasswordScreen extends StatefulWidget {
  final String phone;

  const NewPasswordScreen({super.key, required this.phone});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => NewPasswordBloc(
        authRepository: c.read<PasswordRepository>(),
        phone: widget.phone,
      ),
      child: BlocListener<NewPasswordBloc, NewPasswordState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password updated successfully!')),
            );
            context.go(AppRoutes.loginPath);
          }
        },
        child: Scaffold(
          body: Builder(
            builder: (context) => NewPasswordBody(
              passwordController: _passwordController,
              confirmController: _confirmController,
              onSubmit: () {
                context.read<NewPasswordBloc>().add(const NewPasswordSubmitted());
              },
            ),
          ),
        ),
      ),
    );
  }
}
