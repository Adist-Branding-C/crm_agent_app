import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/section_header.dart';
import '../../../theme.dart';
import 'follow_up_card.dart';

/// Renders the entire Follow-up Calls list container with headers.
class FollowUpsList extends StatelessWidget {
  final List<FollowUpCall> calls;

  /// Creates a constant [FollowUpsList].
  const FollowUpsList({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Follow-up calls',
            actionText: 'View all',
            onActionTap: () => context.pushNamed(AppRoutes.followUps),
          ),
          SizedBox(height: AppSpacing.md),
          CustomCard(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: calls.length,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.slate100,
                height: 1,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return FollowUpCard(call: calls[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
