import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

class AnalyticsTabToggle extends StatelessWidget {
  final AnalyticsTab activeTab;
  final ValueChanged<AnalyticsTab> onTabChanged;

  const AnalyticsTabToggle({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(child: _TabButton(label: 'Leads', isSelected: activeTab == AnalyticsTab.leads, isDeals: false, onTap: () => onTabChanged(AnalyticsTab.leads))),
          Expanded(child: _TabButton(label: 'Deals', isSelected: activeTab == AnalyticsTab.deals, isDeals: true, onTap: () => onTabChanged(AnalyticsTab.deals))),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDeals;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.isDeals,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected && isDeals
              ? Border.all(color: AppColors.warningDark, width: 1.5)
              : null,
          boxShadow: isSelected ? AppShadows.cardShadow : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: context.scaleFont(14),
          ),
        ),
      ),
    );
  }
}
