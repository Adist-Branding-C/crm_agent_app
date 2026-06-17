import 'package:flutter/material.dart';

/// Represents a single action item in the enquiry details FAB menu.
class FabMenuAction {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FabMenuAction({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
