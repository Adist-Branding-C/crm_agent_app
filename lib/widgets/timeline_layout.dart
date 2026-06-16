import 'package:flutter/material.dart';
import 'timeline_tile_marker.dart';
import 'timeline_tile_config.dart';

/// Standardized layout for a timeline tile, featuring connecting lines and marker.
class TimelineLayout extends StatelessWidget {
  /// Whether this is the first item in the timeline.
  final bool isFirst;

  /// Whether this is the last item in the timeline.
  final bool isLast;

  /// Configuration details for the timeline marker.
  final TimelineTileConfig config;

  /// The child content layout.
  final Widget child;

  /// Creates a constant [TimelineLayout].
  const TimelineLayout({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.config,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimelineTileMarker(
            isFirst: isFirst,
            isLast: isLast,
            config: config,
          ),
          const SizedBox(width: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}
