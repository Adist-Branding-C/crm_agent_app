import 'package:flutter/material.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../theme.dart';
import '../../follow_ups/follow_ups_screen.dart';
import 'follow_up_card.dart';

/// Renders the entire Follow-up Calls list container with headers.
class FollowUpsList extends StatelessWidget {
  final List<FollowUpCall> calls;

  /// Creates a constant [FollowUpsList].
  const FollowUpsList({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Follow-up calls',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FollowUpsScreen(),
                    ),
                  );
                },
                child: const Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppTheme.cardShadow,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: calls.length,
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFFF1F5F9),
                height: 1,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return FollowUpCard(call: calls[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
