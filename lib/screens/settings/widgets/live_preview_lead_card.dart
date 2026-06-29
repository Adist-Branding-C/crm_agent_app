import 'package:flutter/material.dart';
import '../../../theme.dart';

class LivePreviewLeadCard extends StatelessWidget {
  const LivePreviewLeadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: const BoxDecoration(
              color: Color(0xFFFFEBEE),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              'PM',
              style: TextStyle(
                color: const Color(0xFFE53935),
                fontWeight: FontWeight.bold,
                fontSize: 13.s,
              ),
            ),
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Priya Menon',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.s,
                  ),
                ),
                AppSpacing.gapXxs,
                Text(
                  'Premium Course · Calicut',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 11.s,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt_rounded, size: 12.s, color: const Color(0xFFE53935)),
                AppSpacing.gapXxs,
                Text(
                  'Hot',
                  style: TextStyle(
                    color: const Color(0xFFE53935),
                    fontWeight: FontWeight.bold,
                    fontSize: 10.s,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
