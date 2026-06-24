import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'fab_menu_item.dart';
import 'fab_actions.dart';

class FabExpandedMenu extends StatelessWidget {
  final VoidCallback onTapItem;

  const FabExpandedMenu({super.key, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    final actions = FabActions.build(context, onTapItem);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final action in actions) ...[
          FabMenuItem(text: action.label, icon: action.icon, color: action.color, onTap: action.onTap),
          AppSpacing.gapMd,
        ],
        AppSpacing.gapLg,
      ],
    );
  }
}
