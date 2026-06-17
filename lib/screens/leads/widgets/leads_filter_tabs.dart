import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../widgets/filter_chip_bar.dart';

/// Renders the horizontal scrollable filter tabs (All, Hot, Warm, Cold).
class LeadsFilterTabs extends StatelessWidget {
  const LeadsFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        if (state is! LeadsLoaded) return const SizedBox.shrink();
        final selected = state.selectedCategory;
        final all = state.allLeads;
        return FilterChipBar(
          options: [
            FilterChipOption(
              label: 'All · ${all.length}',
              isSelected: selected == null,
              onTap: () => context.read<LeadsBloc>().add(const FilterCategoryChanged(null)),
            ),
            for (final cat in [LeadCategory.hot, LeadCategory.warm, LeadCategory.cold])
              FilterChipOption(
                label: '${cat.label} · ${all.where((l) => l.category == cat).length}',
                isSelected: selected == cat,
                onTap: () => context.read<LeadsBloc>().add(FilterCategoryChanged(cat)),
              ),
          ],
        );
      },
    );
  }
}
