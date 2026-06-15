import 'package:flutter/material.dart';
import 'header_actions.dart';
import 'header_title.dart';

/// Renders the composed top header section of the Dashboard.
class DashboardHeader extends StatelessWidget {
  /// Creates a constant [DashboardHeader].
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [HeaderTitle(), HeaderActions()],
      ),
    );
  }
}
