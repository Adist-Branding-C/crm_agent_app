import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'account_body.dart';

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
              child: const AccountBody(),
            ),
          ),
        ],
      ),
    );
  }
}
