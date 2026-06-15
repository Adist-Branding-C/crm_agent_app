import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../../theme.dart';

/// Header widget for Follow-ups Screen showing back button and titles.
class FollowUpHeader extends StatelessWidget {
  /// Creates a constant [FollowUpHeader].
  const FollowUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: AppTheme.cardShadow,
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: AppColors.textDark,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Follow-ups',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 2),
                BlocBuilder<FollowUpsBloc, FollowUpsState>(
                  builder: (context, state) {
                    var dueTodayCount = 0;
                    if (state is FollowUpsLoaded) {
                      dueTodayCount = state.followUps
                          .where((f) => f.urgency == 'due_today')
                          .length;
                    }
                    return Text(
                      '$dueTodayCount due today',
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
