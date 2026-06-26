import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../utils/context_text_extension.dart';
import '../../../theme.dart';

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
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Leads',
              isSelected: activeTab == AnalyticsTab.leads,
              isDeals: false,
              onTap: () => onTabChanged(AnalyticsTab.leads),
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'Deals',
              isSelected: activeTab == AnalyticsTab.deals,
              isDeals: true,
              onTap: () => onTabChanged(AnalyticsTab.deals),
            ),
          ),
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
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 14.s,
            letterSpacing: 0.5.w
          ),
        ),
      ),
    );
  }
}
