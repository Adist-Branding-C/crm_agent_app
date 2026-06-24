import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'checked_in_info.dart';
import 'check_out_button.dart';
import 'fingerprint_icon.dart';

class CheckedInCardBody extends StatelessWidget {
  final String? checkInTime;
  final String location;

  const CheckedInCardBody({
    super.key,
    this.checkInTime,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: AppColors.checkedInCardBg,
      padding: AppSpacing.cardPaddingCompact,
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: AppColors.success,
            bgColor: AppColors.successIconBg,
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: CheckedInInfo(location: location, checkInTime: checkInTime),
          ),
          AppSpacing.gapWSm,
          const CheckOutButton(),
        ],
      ),
    );
  }
}
