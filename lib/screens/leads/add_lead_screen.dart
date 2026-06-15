import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../theme.dart';
import 'widgets/add_lead_form.dart';

/// The container page for adding a new lead.
class AddLeadScreen extends StatelessWidget {
  /// Creates a constant [AddLeadScreen].
  const AddLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLeadBloc(),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const Expanded(child: AddLeadForm()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AppTheme.cardShadow,
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                size: 20,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Add Lead',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
