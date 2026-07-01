import 'package:flutter/material.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../theme.dart';
import 'tab_button.dart';

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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: TabButton(
              label: 'Leads',
              isSelected: activeTab == AnalyticsTab.leads,
              isDeals: false,
              onTap: () => onTabChanged(AnalyticsTab.leads),
            ),
          ),
          Expanded(
            child: TabButton(
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
