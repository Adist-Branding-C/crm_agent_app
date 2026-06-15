import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../widgets/screen_header.dart';
import '../../../theme.dart';
import 'leads_header_actions.dart';

/// Renders the composed top header of the Leads page.
class LeadsHeader extends StatelessWidget {
  /// Creates a constant [LeadsHeader].
  const LeadsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        int total = 0;
        int hot = 0;
        if (state is LeadsLoaded) {
          total = state.allLeads.length;
          hot = state.allLeads.where((l) => l.category == LeadCategory.hot).length;
        }
        return ScreenHeader(
          title: state is LeadsLoaded && state.isSpotlightOnly ? 'Spotlights' : 'My Leads',
          subtitleWidget: Text(
            '$total total · $hot hot',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          showBackButton: false,
          actions: const LeadsHeaderActions(),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        );
      },
    );
  }
}
