import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../bloc/account/account_models.dart';
import '../../data/auth_state_notifier.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/logout_button.dart';
import 'widgets/menu_list.dart';
import 'widgets/monthly_stats.dart';
import 'widgets/profile_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const ScreenHeader(
            title: 'Profile',
            showBackButton: true,
          ),
          Expanded(
            child: BlocListener<AccountBloc, AccountState>(
              listenWhen: (_, state) => state is AccountLoggedOut,
              listener: (context, _) => context.read<AuthStateNotifier>().refresh(),
              child: const _AccountBody(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountBody extends StatelessWidget {
  const _AccountBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountInitial || state is AccountLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AccountError) {
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
        if (state is AccountLoaded) {
          return _AccountContent(profile: state.profile);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _AccountContent extends StatelessWidget {
  final AccountProfile profile;
  const _AccountContent({required this.profile});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
    child: Column(children: [
      ProfileCard(profile: profile),
      const SizedBox(height: 16),
      MonthlyStats(profile: profile),
      const SizedBox(height: 16),
      MenuList(profile: profile),
      const SizedBox(height: 24),
      LogoutButton(onTap: () => context.read<AccountBloc>().add(const LogoutRequested())),
    ]),
  );
}
