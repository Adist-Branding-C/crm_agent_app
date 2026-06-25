import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';

/// Renders the top handle and header title for the Add Deal bottom sheet.
class AddDealHeader extends StatelessWidget {
  const AddDealHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(child: BottomSheetHandle()),
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
