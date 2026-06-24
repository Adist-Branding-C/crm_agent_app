import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../theme.dart';
import '../../widgets/screen_header.dart';
import 'widgets/add_lead_form.dart';

/// The container page for adding a new lead.
class AddLeadScreen extends StatelessWidget {
  /// Creates a constant [AddLeadScreen].
  const AddLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddLeadBloc(leadsRepository: context.read<LeadsRepository>()),
      child: const Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              ScreenHeader(
                title: 'Add Lead',
                showBackButton: true,
                padding: EdgeInsets.only(
                  left: AppSpacing.xxl,
                  right: AppSpacing.xxl,
                  top: AppSpacing.lg,
                  bottom: AppSpacing.sm,
                ),
              ),
              Expanded(child: AddLeadForm()),
            ],
          ),
        ),
      ),
    );
  }
}
