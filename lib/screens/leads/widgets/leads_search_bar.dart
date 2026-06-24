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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          onChanged: (val) {
            context.read<LeadsBloc>().add(SearchLeadsChanged(val));
          },
          decoration: const InputDecoration(
            hintText: 'Search name, phone, location...',
            hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.textMuted,
              size: 20,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(color: AppColors.textDark, fontSize: 14),
        ),
      ),
    );
  }
}
