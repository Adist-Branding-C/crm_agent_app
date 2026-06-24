import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'fab_expanded_menu.dart';

/// Floating Action Button menu that expands vertically to show sub-actions.
class FabMenu extends StatefulWidget {
  /// Creates a constant [FabMenu].
  const FabMenu({super.key});

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  bool _isOpen = false;

  void _closeMenu() {
    setState(() => _isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      right: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isOpen) FabExpandedMenu(onTapItem: _closeMenu),
          FloatingActionButton(
            onPressed: () => setState(() => _isOpen = !_isOpen),
            backgroundColor: AppColors.primaryColor,
            shape: const CircleBorder(),
            child: Icon(_isOpen ? Icons.close : Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
