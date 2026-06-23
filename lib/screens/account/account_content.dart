import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../bloc/account/account_models.dart';
import '../../widgets/responsive_width_container.dart';
import 'widgets/logout_button.dart';
import 'widgets/menu_list.dart';
import 'widgets/monthly_stats.dart';
import 'widgets/profile_card.dart';

class AccountContent extends StatelessWidget {
  final AccountProfile profile;
  const AccountContent({super.key, required this.profile});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
    child: ResponsiveWidthContainer(
      maxWidth: 540,
      child: Column(children: [
        ProfileCard(profile: profile),
        const SizedBox(height: 16),
        MonthlyStats(profile: profile),
        const SizedBox(height: 16),
        MenuList(profile: profile),
        const SizedBox(height: 24),
        LogoutButton(onTap: () => context.read<AccountBloc>().add(const LogoutRequested())),
      ]),
    ),
  );
}
