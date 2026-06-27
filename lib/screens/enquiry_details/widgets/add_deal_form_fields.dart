import 'package:flutter/material.dart';
import '../../../theme.dart';

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
        AppSpacing.gapXs,
        SizedBox(
          height: 65.h,
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Enter deal name'),
          ),
        ),
        AppSpacing.gapXxl,
        const _RequiredLabel(text: 'Amount (₹)'),
        AppSpacing.gapXs,
        SizedBox(
          height: 65.h,
          child: TextFormField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'Enter amount',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.w),
              ),
            ),
          ),
        ),
        AppSpacing.gapXxl,
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
          fontSize: 12.s,
        ),
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(color: AppColors.errorColor, fontSize: 12.5.s),
          ),
        ],
      ),
    );
  }
}
