import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/forgot_password/forgot_password_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../../router/app_routes.dart';
import 'widgets/forgot_password_body.dart';

/// Screen container for the Forgot Password flow.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => ForgotPasswordBloc(
        authRepository: c.read<AuthRepository>(),
      ),
      child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            context.pushNamed(AppRoutes.verifyOtp, extra: state.phone.value);
          }
        },
        child: Scaffold(
          body: ForgotPasswordBody(
            phoneController: _phoneController,
          ),
        ),
      ),
    );
  }
}
