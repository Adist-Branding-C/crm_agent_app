import 'package:flutter/material.dart';
import '../theme.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 38.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors.borderLight,
          borderRadius: BorderRadius.circular(2.5.r),
        ),
      ),
    );
  }
}
