import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../theme.dart';

/// Text input field for Phone number login credentials.
class PhoneField extends StatelessWidget {
  /// Creates a constant [PhoneField] widget.
  const PhoneField({super.key, required this.controller});

  /// The text field controller.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Phone Number',
              style: TextStyle(
                color: AppTheme.textDark,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Semantics(
          label: 'Phone Number Input Field',
          textField: true,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: '+91 98470 ... or digits',
            ),
            onChanged: (value) =>
                context.read<LoginBloc>().add(PhoneChanged(value)),
          ),
        ),
      ],
    );
  }
}
