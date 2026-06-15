import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
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
              _buildTab(context, 'All', all.length, selected == 'All'),
              _buildTab(
                context,
                'Hot',
                all.where((l) => l.category == 'Hot').length,
                selected == 'Hot',
              ),
              _buildTab(
                context,
                'Warm',
                all.where((l) => l.category == 'Warm').length,
                selected == 'Warm',
              ),
              _buildTab(
                context,
                'Cold',
                all.where((l) => l.category == 'Cold').length,
                selected == 'Cold',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(
    BuildContext context,
    String label,
    int count,
    bool isSelected,
  ) {
    final themeColor = isSelected ? AppColors.primaryColor : Colors.white;
    final textColor = isSelected ? Colors.white : AppColors.textMuted;
    final border = isSelected
        ? Border.all(color: Colors.black.withValues(alpha: 0.08), width: 1.5)
        : Border.all(color: AppColors.borderLight);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () =>
            context.read<LeadsBloc>().add(FilterCategoryChanged(label)),
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
