import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme.dart';
import '../../../../bloc/account/account_models.dart';
import '../../../../widgets/responsive_width_container.dart';
import '../../../../widgets/screen_header.dart';
import 'edit_profile_actions.dart';
import 'edit_profile_avatar_card.dart';
import 'personal_details_section.dart';
import 'work_details_section.dart';
import 'target_details_section.dart';

/// Form layout widget arranging all form sections sequentially.
class EditProfileFormLayout extends StatelessWidget {
  final AccountProfile profile;
  final TextEditingController nameController, phoneController, emailController;
  final TextEditingController baseLocationController, targetController;
  final String selectedRole, selectedBranch;
  final bool isSaving;
  final ValueChanged<String> onRoleChanged, onBranchChanged;
  final VoidCallback onSave;

  const EditProfileFormLayout({
    super.key, required this.profile,
    required this.nameController, required this.phoneController, required this.emailController,
    required this.baseLocationController, required this.targetController,
    required this.selectedRole, required this.selectedBranch,
    required this.isSaving, required this.onRoleChanged, required this.onBranchChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(title: 'Edit Profile', subtitle: 'Your account details', showBackButton: true),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(AppSpacing.xxl, 0, AppSpacing.xxl, AppSpacing.xxl),
            child: ResponsiveWidthContainer(
              maxWidth: 540,
              child: Column(
                children: [
                  EditProfileAvatarCard(initials: profile.initials, joinedDate: profile.joinedDate),
                  AppSpacing.gapLg,
                  PersonalDetailsSection(
                    nameController: nameController,
                    phoneController: phoneController,
                    emailController: emailController,
                  ),
                  AppSpacing.gapLg,
                  WorkDetailsSection(
                    selectedRole: selectedRole,
                    selectedBranch: selectedBranch,
                    baseLocationController: baseLocationController,
                    onRoleChanged: onRoleChanged,
                    onBranchChanged: onBranchChanged,
                  ),
                  AppSpacing.gapLg,
                  TargetDetailsSection(targetController: targetController, achievedAmount: profile.achievedAmount),
                  AppSpacing.gapXxl,
                  EditProfileActions(onCancel: () => context.pop(), onSave: onSave, isLoading: isSaving),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
