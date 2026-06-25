import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/text_scaler.dart';
import '../models/dashboard_navigation_item.dart';

/// Bottom navigation bar aligned with the dashboard designs.
class DashboardNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<DashboardNavigationItem> items;

  /// Creates a constant [DashboardNavBar].
  const DashboardNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        border: Border(top: BorderSide(color: AppColors.slate100, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surfaceWhite,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textMuted,
        selectedFontSize: 13.s,
        unselectedFontSize: 12.s,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: items
            .map(
              (item) => BottomNavigationBarItem(
                icon: item.icon,
                activeIcon: item.activeIcon,
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
