import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/account/account_bloc.dart';
import '../../theme.dart';
import '../../widgets/app_loading_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import 'account_content.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountInitial || state is AccountLoading) {
          return const AppLoadingWidget();
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
      child: CustomCard(
        padding: EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, color: AppColors.errorColor, size: 48),
            AppSpacing.gapLg,
            Text(msg, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            AppSpacing.gapXxl,
            SizedBox(
              width: 140,
              child: CustomButton(
                text: 'Retry',
                onPressed: () => context.read<AccountBloc>().add(const LoadAccount()),
                icon: Icons.refresh_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
