import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders the top handle and header title for the Add Deal bottom sheet.
class AddDealHeader extends StatelessWidget {
  const AddDealHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            decoration: const BoxDecoration(
              color: AppColors.slate300,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ),
        AppSpacing.gapLg,
        Text(
          'New Deal',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
