import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../widgets/screen_header.dart';
import '../../../theme.dart';
import 'leads_header_actions.dart';

/// Renders the composed top header of the Leads page.
class LeadsHeader extends StatelessWidget {
  const LeadsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final headerState = context.select<LeadsBloc, ({int total, int hot, bool isSpotlight})>((bloc) {
      if (bloc.state is LeadsLoaded) {
        final s = bloc.state as LeadsLoaded;
        return (total: s.allLeads.length, hot: s.allLeads.where((l) => l.category == LeadCategory.hot).length, isSpotlight: s.isSpotlightOnly);
      }
      return (total: 0, hot: 0, isSpotlight: false);
    });
    return ScreenHeader(
      title: headerState.isSpotlight ? 'Spotlights' : 'My Leads',
      subtitleWidget: Text(
        '${headerState.total} total · ${headerState.hot} hot',
        style: const TextStyle(color: AppColors.textMuted, fontSize: 13, fontWeight: FontWeight.w600),
      ),
      showBackButton: false,
      actions: const LeadsHeaderActions(),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
    );
  }
}
