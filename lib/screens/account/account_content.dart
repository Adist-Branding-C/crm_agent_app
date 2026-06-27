import 'package:flutter/material.dart';
import '../../theme.dart';
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
    padding: EdgeInsets.fromLTRB(
      12.w,
      0,
     12.w,
      AppSpacing.xxl,
    ),
    child: ResponsiveWidthContainer(
      maxWidth: 540.w,
      child: Column(
        children: [
          ProfileCard(profile: profile),
          AppSpacing.gapLg,
          MonthlyStats(profile: profile),
          AppSpacing.gapLg,
          MenuList(profile: profile),
          AppSpacing.gapXs,
          LogoutButton(
            onTap: () =>
                context.read<AccountBloc>().add(const LogoutRequested()),
          ),
        ],
      ),
    ),
  );
}
