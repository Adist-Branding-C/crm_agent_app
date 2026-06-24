import 'package:flutter/material.dart';
import 'quick_action_tile.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        QuickActionTile(
          icon: Icons.calendar_today_outlined,
          label: 'Task',
          color: Colors.orange,
        ),
        QuickActionTile(
          icon: Icons.business_center_outlined,
          label: 'Deal',
          color: Colors.purple,
        ),
        QuickActionTile(
          icon: Icons.chat_bubble_outline_rounded,
          label: 'WhatsApp',
          color: Colors.green,
        ),
        QuickActionTile(
          icon: Icons.description_outlined,
          label: 'Notes',
          color: Colors.blue,
        ),
      ],
    );
  }
}
