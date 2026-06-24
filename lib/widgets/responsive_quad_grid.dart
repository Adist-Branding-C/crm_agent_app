import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/responsive_helper.dart';

class ResponsiveQuadGrid extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveQuadGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveHelper.isTablet(context);
    if (isTablet) {
      return Row(
        children: [
          Expanded(child: Padding(padding: EdgeInsets.only(right: AppSpacing.xs), child: children[0])),
          Expanded(child: Padding(padding: EdgeInsets.only(right: AppSpacing.xs), child: children[1])),
          Expanded(child: Padding(padding: EdgeInsets.only(right: AppSpacing.xs), child: children[2])),
          Expanded(child: children[3]),
        ],
      );
    }
    return Column(
      children: [
        Row(children: [Expanded(child: children[0]), SizedBox(width: AppSpacing.lg), Expanded(child: children[1])]),
        SizedBox(height: AppSpacing.lg),
        Row(children: [Expanded(child: children[2]), SizedBox(width: AppSpacing.lg), Expanded(child: children[3])]),
      ],
    );
  }
}
