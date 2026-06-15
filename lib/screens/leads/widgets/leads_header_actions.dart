import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/filter_result.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/card_icon_button.dart';
import '../../../theme.dart';
import 'filter_sheet.dart';

/// Renders the action buttons (spotlight, filter, add) in the Leads header.
class LeadsHeaderActions extends StatelessWidget {
  /// Creates a constant [LeadsHeaderActions].
  const LeadsHeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        final isSpotlight = state is LeadsLoaded && state.isSpotlightOnly;
        return Row(
          children: [
            CardIconButton(
              icon: Icons.whatshot_rounded,
              iconColor: isSpotlight ? Colors.white : AppColors.primaryColor,
              backgroundColor: isSpotlight ? AppColors.primaryColor : Colors.white,
              size: 38, borderRadius: 10, iconSize: 20,
              onTap: () => context.read<LeadsBloc>().add(const ToggleSpotlight()),
            ),
            const SizedBox(width: 10),
            CardIconButton(
              icon: Icons.tune_rounded, iconColor: AppColors.textDark,
              backgroundColor: Colors.white, size: 38, borderRadius: 10, iconSize: 20,
              onTap: () => _openFilterSheet(context, state),
            ),
            const SizedBox(width: 10),
            CardIconButton(
              icon: Icons.add_rounded, iconColor: AppColors.primaryColor,
              backgroundColor: Colors.white, size: 38, borderRadius: 10, iconSize: 20,
              onTap: () => _openAddScreen(context),
            ),
          ],
        );
      },
    );
  }

  Future<void> _openFilterSheet(BuildContext ctx, LeadsState s) async {
    if (s is! LeadsLoaded) return;
    final res = await showModalBottomSheet<FilterResult>(
      context: ctx, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => FilterSheet(
        initialSortBy: s.sortBy, initialStatus: s.selectedStatus, initialSource: s.selectedSource,
      ),
    );
    if (res != null && ctx.mounted) {
      ctx.read<LeadsBloc>().add(ApplyFilterOptions(sortBy: res.sortBy, status: res.status, source: res.source));
    }
  }

  Future<void> _openAddScreen(BuildContext ctx) async {
    final lead = await ctx.pushNamed<Lead>(AppRoutes.addLead);
    if (lead != null && ctx.mounted) ctx.read<LeadsBloc>().add(AddLead(lead));
  }
}
