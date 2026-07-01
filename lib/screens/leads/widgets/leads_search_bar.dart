import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// Renders the search bar that updates search query in [LeadsBloc].
class LeadsSearchBar extends StatelessWidget {
  /// Creates a constant [LeadsSearchBar].
  const LeadsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: CustomCard(
        borderRadius: 8.r,
        child: TextField(
          onChanged: (val) {
            context.read<LeadsBloc>().add(SearchLeadsChanged(val));
          },
          decoration: InputDecoration(
            hintText: 'Search name, phone, location...',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textMuted),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.textMuted,
              size: 18.s,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.textDark),
        ),
      ),
    );
  }
}
