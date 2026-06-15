import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';

/// Renders a call-to-action button to mock-call a lead.
class LeadCallButton extends StatelessWidget {
  /// Lead to call.
  final Lead lead;

  /// Creates a constant [LeadCallButton].
  const LeadCallButton({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        developer.log('Initiating mock call to ${lead.name} (${lead.phone})');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Calling ${lead.name}...'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppTheme.buttonShadow,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.call_rounded, color: Colors.white, size: 14),
            SizedBox(width: 6),
            Text(
              'Call',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
