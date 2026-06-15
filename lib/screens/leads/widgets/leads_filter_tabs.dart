import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';

/// Renders the horizontal scrollable filter tabs (All, Hot, Warm, Cold).
class LeadsFilterTabs extends StatelessWidget {
  /// Creates a constant [LeadsFilterTabs].
  const LeadsFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        if (state is! LeadsLoaded) return const SizedBox.shrink();
        final selected = state.selectedCategory;
        final all = state.allLeads;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              _buildTab(context, null, all.length, selected == null),
              _buildTab(context, LeadCategory.hot, all.where((l) => l.category == LeadCategory.hot).length, selected == LeadCategory.hot),
              _buildTab(context, LeadCategory.warm, all.where((l) => l.category == LeadCategory.warm).length, selected == LeadCategory.warm),
              _buildTab(context, LeadCategory.cold, all.where((l) => l.category == LeadCategory.cold).length, selected == LeadCategory.cold),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(
    BuildContext context,
    LeadCategory? category,
    int count,
    bool isSelected,
  ) {
    final label = category?.label ?? 'All';
    final themeColor = isSelected ? AppColors.primaryColor : Colors.white;
    final textColor = isSelected ? Colors.white : AppColors.textMuted;
    final border = isSelected
        ? Border.all(color: Colors.black.withValues(alpha: 0.08), width: 1.5)
        : Border.all(color: AppColors.borderLight);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () =>
            context.read<LeadsBloc>().add(FilterCategoryChanged(category)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(20),
            border: border,
            boxShadow: isSelected ? AppTheme.buttonShadow : AppTheme.cardShadow,
          ),
          child: Text(
            '$label · $count',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
