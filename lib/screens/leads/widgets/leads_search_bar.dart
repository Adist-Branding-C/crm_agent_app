import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../theme.dart';

/// Renders the search bar that updates search query in [LeadsBloc].
class LeadsSearchBar extends StatelessWidget {
  /// Creates a constant [LeadsSearchBar].
  const LeadsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextField(
          onChanged: (val) {
            context.read<LeadsBloc>().add(SearchLeadsChanged(val));
          },
          decoration:  InputDecoration(
            hintText: 'Search name, phone, location...',
            hintStyle:  TextStyle(color: AppColors.textMuted, fontSize: 14.5.s),
            prefixIcon:  Icon(
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
          style:  TextStyle(color: AppColors.textDark, fontSize: 14.5.s),
        ),
      ),
    );
  }
}
