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
        _buildLabel('Deal name'),
        const SizedBox(height: 6),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Enter deal name',
          ),
        ),
        const SizedBox(height: 16),
        _buildLabel('Amount (₹)'),
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

  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: AppColors.slate600,
          fontWeight: FontWeight.w500,
          fontSize: 12,
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
