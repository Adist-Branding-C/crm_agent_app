import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/change_password/change_password_bloc.dart';
import '../../data/repositories/password_repository.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/change_password_body.dart';

/// Entry page/screen for the Change Password feature.
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) =>
          ChangePasswordBloc(authRepository: c.read<PasswordRepository>()),
      child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password changed successfully!')),
            );
            context.pop();
          } else if (state.status == FormzSubmissionStatus.failure &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: PageScaffold(
          padding: EdgeInsets.zero,
          child: Builder(
            builder: (context) => ChangePasswordBody(
              currentController: _currentController,
              newController: _newController,
              confirmController: _confirmController,
              onCancel: () => context.pop(),
              onSubmit: () => context.read<ChangePasswordBloc>().add(
                const ChangePasswordSubmitted(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
