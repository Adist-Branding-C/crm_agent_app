import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(context, Icons.calendar_today_outlined, 'Task', Colors.orange),
        _buildAction(context, Icons.business_center_outlined, 'Deal', Colors.purple),
        _buildAction(context, Icons.chat_bubble_outline_rounded, 'WhatsApp', Colors.green),
        _buildAction(context, Icons.description_outlined, 'Notes', Colors.blue),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shortcut to $label tapped')),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 76,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
