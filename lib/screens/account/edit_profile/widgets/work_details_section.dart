import 'package:flutter/material.dart';
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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectionGroup(
                label: 'Role',
                options: const ['Sales Agent', 'Senior Agent', 'Team Lead'],
                selectedOption: selectedRole,
                onSelected: onRoleChanged,
              ),
              const SizedBox(height: 16),
              SelectionGroup(
                label: 'Branch',
                options: const ['Calicut', 'Kochi', 'Trivandrum', 'Kannur'],
                selectedOption: selectedBranch,
                onSelected: onBranchChanged,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Base location',
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
