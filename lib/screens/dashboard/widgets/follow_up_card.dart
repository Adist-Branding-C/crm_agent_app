import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/repositories/leads_repository.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../widgets/call_button.dart';

/// Renders a single row in the follow-up calls list.
class FollowUpCard extends StatelessWidget {
  final FollowUpCall call;

  /// Creates a constant [FollowUpCard].
  const FollowUpCard({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    final isPriority = call.tag == FollowUpTag.priority;
    final tagBg = isPriority ? AppColors.primaryColorLight : AppColors.warningBackground;
    final tagText = isPriority ? AppColors.primaryColor : AppColors.warning;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: tagBg, borderRadius: BorderRadius.circular(6)),
                  child: Text(call.tag.label, style: TextStyle(color: tagText, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    final clean = call.name.replaceAll('Call back ', '').trim().toLowerCase();
                    final leads = await context.read<LeadsRepository>().getLeads();
                    final match = leads.cast<Lead?>().firstWhere((l) => l?.name.toLowerCase() == clean, orElse: () => null);
                    if (match != null && context.mounted) {
                      context.pushNamed(AppRoutes.enquiryDetails, pathParameters: {'id': match.id});
                    }
                  },
                  child: Text(call.name, style: Theme.of(context).textTheme.titleMedium),
                ),
                const SizedBox(height: 3),
                Text(call.time, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CallButton(
            onTap: () => context.read<CallLogBloc>().add(InitiateCallByName(name: call.name)),
          ),
        ],
      ),
    );
  }
}
