import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../theme.dart';
import '../../../../utils/context_text_extension.dart';
import '../models/deals_view_notifier.dart';
import 'deals_toggle_item.dart';

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
        padding: EdgeInsets.all(3.w),
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
