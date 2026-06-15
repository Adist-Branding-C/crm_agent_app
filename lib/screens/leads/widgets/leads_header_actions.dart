import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/leads_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import '../add_lead_screen.dart';

/// Renders the action buttons (spotlight, filter, add) in the Leads header.
class LeadsHeaderActions extends StatelessWidget {
  /// Creates a constant [LeadsHeaderActions].
  const LeadsHeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        final isSpotlight = state is LeadsLoaded && state.isSpotlightOnly;
        return Row(
          children: [
            _buildButton(
              icon: Icons.whatshot_rounded,
              iconColor: isSpotlight ? Colors.white : AppColors.primaryColor,
              bgColor: isSpotlight ? AppColors.primaryColor : Colors.white,
              onTap: () =>
                  context.read<LeadsBloc>().add(const ToggleSpotlight()),
            ),
            const SizedBox(width: 10),
            _buildButton(
              icon: Icons.tune_rounded,
              iconColor: AppColors.textDark,
              bgColor: Colors.white,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            _buildButton(
              icon: Icons.add_rounded,
              iconColor: AppColors.primaryColor,
              bgColor: Colors.white,
              onTap: () async {
                final bloc = context.read<LeadsBloc>();
                final lead = await Navigator.push<Lead>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddLeadScreen(),
                  ),
                );
                if (lead != null) bloc.add(AddLead(lead));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildButton({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
