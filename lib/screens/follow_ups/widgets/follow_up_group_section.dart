import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../widgets/section_header.dart';
import '../../../theme.dart';
import 'follow_up_item_card.dart';

/// Renders a section header and a list of follow-up item cards.
class FollowUpGroupSection extends StatelessWidget {
  final String title;
  final List<FollowUp> items;
  final IconData leadingIcon;
  final Color leadingIconColor;
  final Color badgeBgColor;
  final Color badgeTextColor;

  const FollowUpGroupSection({
    super.key,
    required this.title,
    required this.items,
    required this.leadingIcon,
    required this.leadingIconColor,
    required this.badgeBgColor,
    required this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
          title: title,
          countBadge: items.length,
          leadingIcon: leadingIcon,
          leadingIconColor: leadingIconColor,
          badgeBgColor: badgeBgColor,
          badgeTextColor: badgeTextColor,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        ),
        ...items.map(
          (c) => FollowUpItemCard(
            call: c,
            onCallTap: () => context.read<CallLogBloc>().add(
              InitiateCallByName(name: c.name),
            ),
          ),
        ),
        AppSpacing.gapSm,
      ],
    );
  }
}
