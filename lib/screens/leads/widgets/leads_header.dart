import 'package:flutter/material.dart';
import 'leads_header_actions.dart';
import 'leads_header_title.dart';

/// Renders the composed top header of the Leads page.
class LeadsHeader extends StatelessWidget {
  /// Creates a constant [LeadsHeader].
  const LeadsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [LeadsHeaderTitle(), LeadsHeaderActions()],
      ),
    );
  }
}
