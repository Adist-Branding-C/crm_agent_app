import 'package:flutter/material.dart';
import '../theme.dart';

class CallButton extends StatelessWidget {
  final VoidCallback? onTap;
   double? borderRadius;

   CallButton({super.key, this.onTap, this.borderRadius });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      ),
      child: Semantics(
        button: true,
        label: 'Call lead',
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            child:  Container(
              height: 50.h,
              width: 55.w,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call_rounded,
                    color: AppColors.surfaceWhite,
                    size: 14.s,
                  ),
                  SizedBox(width: AppSpacing.xs2),
                  Text(
                    'Call',
                    style: TextStyle(
                      color: AppColors.surfaceWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.s,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
