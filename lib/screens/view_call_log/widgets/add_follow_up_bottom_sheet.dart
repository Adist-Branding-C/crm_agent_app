import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/follow_ups/add_follow_up_cubit.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import 'add_follow_up_form.dart';

/// Modal bottom sheet container for the Add Follow-up form.
class AddFollowUpBottomSheet extends StatelessWidget {
  final Lead lead;

  const AddFollowUpBottomSheet({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSpacing.gapMd,
          const BottomSheetHandle(),
          AppSpacing.gapLg,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
            child: Text(
              'New Follow-up',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: BlocProvider(
              create: (context) => AddFollowUpCubit(
                dashboardRepository: context.read(),
                followUpsRepository: context.read(),
              ),
              child: AddFollowUpForm(lead: lead),
            ),
          ),
        ],
      ),
    );
  }
}
