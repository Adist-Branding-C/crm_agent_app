import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../bloc/account/account_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'account_body.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(const LoadAccount());
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Profile',
            showBackButton: true,
            padding: EdgeInsets.fromLTRB(12.0.w, 25.0.h, 12.0.w, 13.0.h),
          ),
          Expanded(
            child: BlocListener<AccountBloc, AccountState>(
              listenWhen: (_, state) => state is AccountLoggedOut,
              listener: (context, _) =>
                  context.read<AuthStateNotifier>().refresh(),
              child: const AccountBody(),
            ),
          ),
        ],
      ),
    );
  }
}
