import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/account/account_bloc.dart';
import '../../../widgets/page_scaffold.dart';
import 'widgets/edit_profile_form.dart';

/// Screen widget displaying Edit Profile inputs wrapped in scaffolding.
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: BlocConsumer<AccountBloc, AccountState>(
        listenWhen: (p, c) => c is AccountUpdateSuccess || c is AccountUpdateFailure,
        listener: (context, state) {
          if (state is AccountUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
            context.pop();
          } else if (state is AccountUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AccountLoaded) {
            return EditProfileForm(
              profile: state.profile,
              isSaving: state is AccountUpdating,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
