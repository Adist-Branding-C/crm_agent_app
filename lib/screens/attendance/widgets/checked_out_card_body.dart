import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'check_in_button.dart';
import 'checked_out_info.dart';
import 'fingerprint_icon.dart';

class CheckedOutCardBody extends StatelessWidget {
  const CheckedOutCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: AppSpacing.cardPaddingCompact,
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: AppColors.primaryColor,
            bgColor: AppColors.errorBackground,
          ),
          AppSpacing.gapWMd,
          const Expanded(child: CheckedOutInfo()),
          AppSpacing.gapWSm,
          const CheckInButton(),
        ],
      ),
    );
  }
}
