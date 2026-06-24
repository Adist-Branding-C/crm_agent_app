import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/account/account_bloc.dart';
import '../../../../bloc/account/account_models.dart';
import '../../../../bloc/account/account_profile_extensions.dart';
import 'edit_profile_form_layout.dart';

/// Form StatefulWidget managing controller states and submit logic.
class EditProfileForm extends StatefulWidget {
  final AccountProfile profile;
  final bool isSaving;
  const EditProfileForm({
    super.key,
    required this.profile,
    required this.isSaving,
  });
  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _baseLocationController;
  late final TextEditingController _targetController;
  String _selectedRole = '';
  String _selectedBranch = '';

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nameController = TextEditingController(text: p.name);
    _phoneController = TextEditingController(text: p.phone);
    _emailController = TextEditingController(text: p.email);
    _baseLocationController = TextEditingController(text: p.baseLocation);
    _targetController = TextEditingController(text: p.monthlyTarget.toString());
    _selectedRole = p.role;
    _selectedBranch = p.branch;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _baseLocationController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AccountBloc>().add(
        UpdateProfile(
          profile: widget.profile.copyWith(
            name: _nameController.text,
            phone: _phoneController.text,
            email: _emailController.text,
            baseLocation: _baseLocationController.text,
            monthlyTarget:
                int.tryParse(_targetController.text) ??
                widget.profile.monthlyTarget,
            role: _selectedRole,
            branch: _selectedBranch,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: EditProfileFormLayout(
        profile: widget.profile,
        nameController: _nameController,
        phoneController: _phoneController,
        emailController: _emailController,
        baseLocationController: _baseLocationController,
        targetController: _targetController,
        selectedRole: _selectedRole,
        selectedBranch: _selectedBranch,
        isSaving: widget.isSaving,
        onRoleChanged: (val) => setState(() => _selectedRole = val),
        onBranchChanged: (val) => setState(() => _selectedBranch = val),
        onSave: _onSave,
      ),
    );
  }
}
