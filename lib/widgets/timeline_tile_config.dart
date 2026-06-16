import 'package:flutter/material.dart';

/// Configuration details for a timeline event type.
class TimelineTileConfig {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const TimelineTileConfig({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}
