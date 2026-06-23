import 'package:flutter/material.dart';
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
          Row(children: [Expanded(child: children[0]), const SizedBox(width: 8), Expanded(child: children[1])]),
          const SizedBox(height: 8),
          Row(children: [Expanded(child: children[2]), const SizedBox(width: 8), Expanded(child: children[3])]),
        ],
      );
    }
    return Row(
      children: children.map((c) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Expanded(child: c),
      )).toList(),
    );
  }
}