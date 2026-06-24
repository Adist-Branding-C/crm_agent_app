import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/responsive_helper.dart';

class ResponsiveQuadGrid extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveQuadGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final isCompact = ResponsiveHelper.isMobileSmall(context);
    if (isCompact) {
      return Column(
        children: [
          Row(children: [Expanded(child: children[0]), AppSpacing.gapWSm, Expanded(child: children[1])]),
          AppSpacing.gapSm,
          Row(children: [Expanded(child: children[2]), AppSpacing.gapWSm, Expanded(child: children[3])]),
        ],
      );
    }
    return Row(
      children: children.map((c) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Expanded(child: c),
      )).toList(),
    );
  }
}