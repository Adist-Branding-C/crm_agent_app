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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: AppColors.primaryColor,
            bgColor: AppColors.errorBackground,
          ),
          const SizedBox(width: 12),
          const Expanded(child: CheckedOutInfo()),
          const SizedBox(width: 8),
          const CheckInButton(),
        ],
      ),
    );
  }
}
