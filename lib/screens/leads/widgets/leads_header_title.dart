import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../theme.dart';

/// Renders the Leads page title and dynamically calculated counts.
class LeadsHeaderTitle extends StatelessWidget {
  /// Creates a constant [LeadsHeaderTitle].
  const LeadsHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        int total = 0;
        int hot = 0;
        if (state is LeadsLoaded) {
          total = state.allLeads.length;
          hot = state.allLeads.where((l) => l.category == 'Hot').length;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state is LeadsLoaded && state.isSpotlightOnly
                  ? 'Spotlights'
                  : 'My Leads',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$total total · $hot hot',
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }
}
