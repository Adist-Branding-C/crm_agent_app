import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../theme.dart';
import '../../../../utils/context_text_extension.dart';
import '../models/deals_view_notifier.dart';

/// Toggle widget to switch between Pipeline (Kanban) and List views.
class DealsToggle extends StatelessWidget {
  const DealsToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<DealsViewNotifier>().value;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.md,
      ),
      child: Container(
        height: 55.h,
        padding:  EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: AppColors.borderLightAlpha50,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: DealsToggleItem(
                index: 0,
                label: 'Pipeline',
                isSelected: selectedIndex == 0,
                onTap: () => context.read<DealsViewNotifier>().toggle(0),
              ),
            ),
            Expanded(
              child: DealsToggleItem(
                index: 1,
                label: 'List',
                isSelected: selectedIndex == 1,
                onTap: () => context.read<DealsViewNotifier>().toggle(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DealsToggleItem extends StatelessWidget {
  final int index;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const DealsToggleItem({
    super.key,
    required this.index,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding:  EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 13.0.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceWhite : AppColors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize:12.s,
          ),
        ),
      ),
    );
  }
}
