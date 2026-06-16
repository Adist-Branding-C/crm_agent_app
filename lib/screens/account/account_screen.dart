import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/card_icon_button.dart';
import '../../widgets/async_state_view.dart';
import 'widgets/profile_card.dart';
import 'widgets/monthly_stats.dart';
import 'widgets/menu_list.dart';
import 'widgets/logout_button.dart';

/// Screen displaying agent profile settings, metrics, and actions.
class AccountScreen extends StatelessWidget {
  /// Creates a constant [AccountScreen].
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is AccountLoggedOut) {
            context.read<AuthStateNotifier>().refresh();
          }
        },
        builder: (context, state) => Column(
          children: [
            ScreenHeader(
              title: 'Profile',
              showBackButton: true,
              actions: CardIconButton(icon: Icons.settings_outlined, onTap: () {}),
            ),
            Expanded(
              child: AsyncStateView(
                isLoading: state is AccountInitial || state is AccountLoading,
                hasError: state is AccountError,
                errorMessage: state is AccountError ? state.errorMessage : '',
                onRetry: () => context.read<AccountBloc>().add(const LoadAccount()),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      if (state is AccountLoaded) ...[
                        ProfileCard(profile: state.profile),
                        const SizedBox(height: 16),
                        MonthlyStats(profile: state.profile),
                        const SizedBox(height: 16),
                        MenuList(profile: state.profile),
                        const SizedBox(height: 24),
                        LogoutButton(
                          onTap: () => context.read<AccountBloc>().add(const LogoutRequested()),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

