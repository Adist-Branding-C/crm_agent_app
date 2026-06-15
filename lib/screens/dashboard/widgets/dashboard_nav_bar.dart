import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Bottom navigation bar aligned with the dashboard designs.
class DashboardNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  /// Creates a constant [DashboardNavBar].
  const DashboardNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textMuted,
        elevation: 0,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 22),
            activeIcon: Icon(Icons.home_rounded, size: 22),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_rounded, size: 22),
            activeIcon: Icon(Icons.people_rounded, size: 22),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined, size: 22),
            activeIcon: Icon(Icons.check_box_rounded, size: 22),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 22),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
