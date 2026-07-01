import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/selection_group.dart';

/// Form section for agent work details (Role chips, Branch chips, Base location).
class WorkDetailsSection extends StatelessWidget {
  final String selectedRole;
  final String selectedBranch;
  final TextEditingController baseLocationController;
  final ValueChanged<String> onRoleChanged;
  final ValueChanged<String> onBranchChanged;

  const WorkDetailsSection({
    super.key,
    required this.selectedRole,
    required this.selectedBranch,
    required this.baseLocationController,
    required this.onRoleChanged,
    required this.onBranchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work details',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        AppSpacing.gapMd,
        CustomCard(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectionGroup(
                label: 'Role',
                options: const ['Sales Agent', 'Senior Agent', 'Team Lead'],
                selectedOption: selectedRole,
                onSelected: onRoleChanged,
              ),
              AppSpacing.gapLg,
              SelectionGroup(
                label: 'Branch',
                options: const ['Calicut', 'Kochi', 'Trivandrum', 'Kannur'],
                selectedOption: selectedBranch,
                onSelected: onBranchChanged,
              ),
              AppSpacing.gapLg,
              CustomTextField(
                label: 'Base location',
                height: 60.h,
                hintText: 'Enter base location',
                controller: baseLocationController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
