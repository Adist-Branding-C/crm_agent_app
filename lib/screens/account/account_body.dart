import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import 'account_content.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountInitial || state is AccountLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AccountError) {
          return _ErrorView(state: state);
        }
        if (state is AccountLoaded) {
          return AccountContent(profile: state.profile);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final AccountError state;
  const _ErrorView({required this.state});

  @override
  Widget build(BuildContext context) {
    final msg = switch (state.failure) {
      AccountFailure.loadProfile => 'Failed to load profile.',
      AccountFailure.logout => 'Failed to logout.',
      AccountFailure.unknown => 'An error occurred.',
    };
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<AccountBloc>().add(const LoadAccount()),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
