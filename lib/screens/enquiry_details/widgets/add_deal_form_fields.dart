import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class AddDealFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;

  const AddDealFormFields({
    super.key,
    required this.nameController,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RequiredLabel(text: 'Deal name'),
        const SizedBox(height: 6),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Enter deal name',
          ),
        ),
        const SizedBox(height: 16),
        const _RequiredLabel(text: 'Amount (₹)'),
        const SizedBox(height: 6),
        TextFormField(
          controller: amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            hintText: 'Enter amount',
          ),
        ),
      ],
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  final String text;
  const _RequiredLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.slate600,
          fontWeight: FontWeight.w500,
        ),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: AppColors.errorColor),
          ),
        ],
      ),
    );
  }
}
